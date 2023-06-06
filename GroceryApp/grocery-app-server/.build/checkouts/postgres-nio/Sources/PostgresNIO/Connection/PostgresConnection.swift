import Atomics
import NIOCore
import NIOPosix
#if canImport(Network)
import NIOTransportServices
#endif
import NIOSSL
import Logging

/// A Postgres connection. Use it to run queries against a Postgres server.
///
/// Thread safety is achieved by dispatching all access to shared state onto the underlying EventLoop.
public final class PostgresConnection: @unchecked Sendable {
    /// A Postgres connection ID
    public typealias ID = Int

    /// The connection's underlying channel
    ///
    /// This should be private, but it is needed for `PostgresConnection` compatibility.
    internal let channel: Channel

    /// The underlying `EventLoop` of both the connection and its channel.
    public var eventLoop: EventLoop {
        return self.channel.eventLoop
    }

    public var closeFuture: EventLoopFuture<Void> {
        return self.channel.closeFuture
    }

    /// A logger to use in case
    public var logger: Logger {
        get {
            self._logger
        }
        set {
            // ignore
        }
    }

    /// A dictionary to store notification callbacks in
    ///
    /// Those are used when `PostgresConnection.addListener` is invoked. This only lives here since properties
    /// can not be added in extensions. All relevant code lives in `PostgresConnection+Notifications`
    var notificationListeners: [String: [(PostgresListenContext, (PostgresListenContext, PostgresMessage.NotificationResponse) -> Void)]] = [:] {
        willSet {
            self.channel.eventLoop.preconditionInEventLoop()
        }
    }

    public var isClosed: Bool {
        return !self.channel.isActive
    }

    let id: ID

    private var _logger: Logger

    init(channel: Channel, connectionID: ID, logger: Logger) {
        self.channel = channel
        self.id = connectionID
        self._logger = logger
    }
    deinit {
        assert(self.isClosed, "PostgresConnection deinitialized before being closed.")
    }

    func start(configuration: InternalConfiguration) -> EventLoopFuture<Void> {
        // 1. configure handlers

        let configureSSLCallback: ((Channel) throws -> ())?
        
        switch configuration.tls.base {
        case .prefer(let context), .require(let context):
            configureSSLCallback = { channel in
                channel.eventLoop.assertInEventLoop()

                let sslHandler = try NIOSSLClientHandler(
                    context: context,
                    serverHostname: configuration.serverNameForTLS
                )
                try channel.pipeline.syncOperations.addHandler(sslHandler, position: .first)
            }
        case .disable:
            configureSSLCallback = nil
        }

        let channelHandler = PostgresChannelHandler(
            configuration: configuration,
            logger: logger,
            configureSSLCallback: configureSSLCallback
        )
        channelHandler.notificationDelegate = self

        let eventHandler = PSQLEventsHandler(logger: logger)

        // 2. add handlers

        do {
            try self.channel.pipeline.syncOperations.addHandler(eventHandler)
            try self.channel.pipeline.syncOperations.addHandler(channelHandler, position: .before(eventHandler))
        } catch {
            return self.eventLoop.makeFailedFuture(error)
        }

        let startupFuture: EventLoopFuture<Void>
        if configuration.username == nil {
            startupFuture = eventHandler.readyForStartupFuture
        } else {
            startupFuture = eventHandler.authenticateFuture
        }

        // 3. wait for startup future to succeed.

        return startupFuture.flatMapError { error in
            // in case of an startup error, the connection must be closed and after that
            // the originating error should be surfaced

            self.channel.closeFuture.flatMapThrowing { _ in
                throw error
            }
        }
    }

    /// Create a new connection to a Postgres server
    ///
    /// - Parameters:
    ///   - eventLoop: The `EventLoop` the request shall be created on
    ///   - configuration: A ``Configuration`` that shall be used for the connection
    ///   - connectionID: An `Int` id, used for metadata logging
    ///   - logger: A logger to log background events into
    /// - Returns: A SwiftNIO `EventLoopFuture` that will provide a ``PostgresConnection``
    ///            at a later point in time.
    public static func connect(
        on eventLoop: EventLoop,
        configuration: PostgresConnection.Configuration,
        id connectionID: ID,
        logger: Logger
    ) -> EventLoopFuture<PostgresConnection> {
        self.connect(
            connectionID: connectionID,
            configuration: .init(configuration),
            logger: logger,
            on: eventLoop
        )
    }

    static func connect(
        connectionID: ID,
        configuration: PostgresConnection.InternalConfiguration,
        logger: Logger,
        on eventLoop: EventLoop
    ) -> EventLoopFuture<PostgresConnection> {

        var logger = logger
        logger[postgresMetadataKey: .connectionID] = "\(connectionID)"

        // Here we dispatch to the `eventLoop` first before we setup the EventLoopFuture chain, to
        // ensure all `flatMap`s are executed on the EventLoop (this means the enqueuing of the
        // callbacks).
        //
        // This saves us a number of context switches between the thread the Connection is created
        // on and the EventLoop. In addition, it eliminates all potential races between the creating
        // thread and the EventLoop.
        return eventLoop.flatSubmit { () -> EventLoopFuture<PostgresConnection> in
            let connectFuture: EventLoopFuture<Channel>
            let bootstrap = self.makeBootstrap(on: eventLoop, configuration: configuration)

            switch configuration.connection {
            case .resolved(let address):
                connectFuture = bootstrap.connect(to: address)
            case .unresolvedTCP(let host, let port):
                connectFuture = bootstrap.connect(host: host, port: port)
            case .unresolvedUDS(let path):
                connectFuture = bootstrap.connect(unixDomainSocketPath: path)
            case .bootstrapped(let channel):
                guard channel.isActive else {
                    return eventLoop.makeFailedFuture(PSQLError.connectionError(underlying: ChannelError.alreadyClosed))
                }
                connectFuture = eventLoop.makeSucceededFuture(channel)
            }

            return connectFuture.flatMap { channel -> EventLoopFuture<PostgresConnection> in
                let connection = PostgresConnection(channel: channel, connectionID: connectionID, logger: logger)
                return connection.start(configuration: configuration).map { _ in connection }
            }.flatMapErrorThrowing { error -> PostgresConnection in
                switch error {
                case is PSQLError:
                    throw error
                default:
                    throw PSQLError.connectionError(underlying: error)
                }
            }
        }
    }

    static func makeBootstrap(
        on eventLoop: EventLoop,
        configuration: PostgresConnection.InternalConfiguration
    ) -> NIOClientTCPBootstrapProtocol {
        #if canImport(Network)
        if let tsBootstrap = NIOTSConnectionBootstrap(validatingGroup: eventLoop) {
            return tsBootstrap.connectTimeout(configuration.options.connectTimeout)
        }
        #endif

        if let nioBootstrap = ClientBootstrap(validatingGroup: eventLoop) {
            return nioBootstrap.connectTimeout(configuration.options.connectTimeout)
        }

        fatalError("No matching bootstrap found")
    }

    // MARK: Query

    private func queryStream(_ query: PostgresQuery, logger: Logger) -> EventLoopFuture<PSQLRowStream> {
        var logger = logger
        logger[postgresMetadataKey: .connectionID] = "\(self.id)"
        guard query.binds.count <= Int(UInt16.max) else {
            return self.channel.eventLoop.makeFailedFuture(PSQLError(code: .tooManyParameters, query: query))
        }

        let promise = self.channel.eventLoop.makePromise(of: PSQLRowStream.self)
        let context = ExtendedQueryContext(
            query: query,
            logger: logger,
            promise: promise)

        self.channel.write(PSQLTask.extendedQuery(context), promise: nil)

        return promise.futureResult
    }

    // MARK: Prepared statements

    func prepareStatement(_ query: String, with name: String, logger: Logger) -> EventLoopFuture<PSQLPreparedStatement> {
        let promise = self.channel.eventLoop.makePromise(of: RowDescription?.self)
        let context = PrepareStatementContext(
            name: name,
            query: query,
            logger: logger,
            promise: promise)

        self.channel.write(PSQLTask.preparedStatement(context), promise: nil)
        return promise.futureResult.map { rowDescription in
            PSQLPreparedStatement(name: name, query: query, connection: self, rowDescription: rowDescription)
        }
    }

    func execute(_ executeStatement: PSQLExecuteStatement, logger: Logger) -> EventLoopFuture<PSQLRowStream> {
        guard executeStatement.binds.count <= Int(UInt16.max) else {
            return self.channel.eventLoop.makeFailedFuture(PSQLError(code: .tooManyParameters))
        }
        let promise = self.channel.eventLoop.makePromise(of: PSQLRowStream.self)
        let context = ExtendedQueryContext(
            executeStatement: executeStatement,
            logger: logger,
            promise: promise)

        self.channel.write(PSQLTask.extendedQuery(context), promise: nil)
        return promise.futureResult
    }

    func close(_ target: CloseTarget, logger: Logger) -> EventLoopFuture<Void> {
        let promise = self.channel.eventLoop.makePromise(of: Void.self)
        let context = CloseCommandContext(target: target, logger: logger, promise: promise)

        self.channel.write(PSQLTask.closeCommand(context), promise: nil)
        return promise.futureResult
    }


    /// Closes the connection to the server.
    ///
    /// - Returns: An EventLoopFuture that is succeeded once the connection is closed.
    public func close() -> EventLoopFuture<Void> {
        guard !self.isClosed else {
            return self.eventLoop.makeSucceededFuture(())
        }

        self.channel.close(mode: .all, promise: nil)
        return self.closeFuture
    }
}

// MARK: Connect

extension PostgresConnection {
    static let idGenerator = ManagedAtomic(0)

    @available(*, deprecated,
        message: "Use the new connect method that allows you to connect and authenticate in a single step",
        renamed: "connect(on:configuration:id:logger:)"
    )
    public static func connect(
        to socketAddress: SocketAddress,
        tlsConfiguration: TLSConfiguration? = nil,
        serverHostname: String? = nil,
        logger: Logger = .init(label: "codes.vapor.postgres"),
        on eventLoop: EventLoop
    ) -> EventLoopFuture<PostgresConnection> {
        var tlsFuture: EventLoopFuture<PostgresConnection.Configuration.TLS>

        if let tlsConfiguration = tlsConfiguration {
            tlsFuture = eventLoop.makeSucceededVoidFuture().flatMapBlocking(onto: .global(qos: .default)) {
                try .require(.init(configuration: tlsConfiguration))
            }
        } else {
            tlsFuture = eventLoop.makeSucceededFuture(.disable)
        }

        return tlsFuture.flatMap { tls in
            var options = PostgresConnection.Configuration.Options()
            options.tlsServerName = serverHostname
            let configuration = PostgresConnection.InternalConfiguration(
                connection: .resolved(address: socketAddress),
                username: nil,
                password: nil,
                database: nil,
                tls: tls,
                options: options
            )

            return PostgresConnection.connect(
                connectionID: self.idGenerator.wrappingIncrementThenLoad(ordering: .relaxed),
                configuration: configuration,
                logger: logger,
                on: eventLoop
            )
        }.flatMapErrorThrowing { error in
            throw error.asAppropriatePostgresError
        }
    }

    @available(*, deprecated,
        message: "Use the new connect method that allows you to connect and authenticate in a single step",
        renamed: "connect(on:configuration:id:logger:)"
    )
    public func authenticate(
        username: String,
        database: String? = nil,
        password: String? = nil,
        logger: Logger = .init(label: "codes.vapor.postgres")
    ) -> EventLoopFuture<Void> {
        let authContext = AuthContext(
            username: username,
            password: password,
            database: database)
        let outgoing = PSQLOutgoingEvent.authenticate(authContext)
        self.channel.triggerUserOutboundEvent(outgoing, promise: nil)

        return self.channel.pipeline.handler(type: PSQLEventsHandler.self).flatMap { handler in
            handler.authenticateFuture
        }.flatMapErrorThrowing { error in
            throw error.asAppropriatePostgresError
        }
    }
}

// MARK: Async/Await Interface

extension PostgresConnection {

    /// Creates a new connection to a Postgres server.
    ///
    /// - Parameters:
    ///   - eventLoop: The `EventLoop` the request shall be created on
    ///   - configuration: A ``Configuration`` that shall be used for the connection
    ///   - connectionID: An `Int` id, used for metadata logging
    ///   - logger: A logger to log background events into
    /// - Returns: An established  ``PostgresConnection`` asynchronously that can be used to run queries.
    public static func connect(
        on eventLoop: EventLoop,
        configuration: PostgresConnection.Configuration,
        id connectionID: ID,
        logger: Logger
    ) async throws -> PostgresConnection {
        try await self.connect(
            connectionID: connectionID,
            configuration: .init(configuration),
            logger: logger,
            on: eventLoop
        ).get()
    }

    /// Closes the connection to the server.
    public func close() async throws {
        try await self.close().get()
    }

    /// Run a query on the Postgres server the connection is connected to.
    ///
    /// - Parameters:
    ///   - query: The ``PostgresQuery`` to run
    ///   - logger: The `Logger` to log into for the query
    ///   - file: The file, the query was started in. Used for better error reporting.
    ///   - line: The line, the query was started in. Used for better error reporting.
    /// - Returns: A ``PostgresRowSequence`` containing the rows the server sent as the query result.
    ///            The sequence  be discarded.
    @discardableResult
    public func query(
        _ query: PostgresQuery,
        logger: Logger,
        file: String = #fileID,
        line: Int = #line
    ) async throws -> PostgresRowSequence {
        var logger = logger
        logger[postgresMetadataKey: .connectionID] = "\(self.id)"

        guard query.binds.count <= Int(UInt16.max) else {
            throw PSQLError(code: .tooManyParameters, query: query, file: file, line: line)
        }
        let promise = self.channel.eventLoop.makePromise(of: PSQLRowStream.self)
        let context = ExtendedQueryContext(
            query: query,
            logger: logger,
            promise: promise
        )

        self.channel.write(PSQLTask.extendedQuery(context), promise: nil)

        do {
            return try await promise.futureResult.map({ $0.asyncSequence() }).get()
        } catch var error as PSQLError {
            error.file = file
            error.line = line
            error.query = query
            throw error // rethrow with more metadata
        }
    }
}

// MARK: EventLoopFuture interface

extension PostgresConnection {

    /// Run a query on the Postgres server the connection is connected to and collect all rows.
    ///
    /// - Parameters:
    ///   - query: The ``PostgresQuery`` to run
    ///   - logger: The `Logger` to log into for the query
    ///   - file: The file, the query was started in. Used for better error reporting.
    ///   - line: The line, the query was started in. Used for better error reporting.
    /// - Returns: An EventLoopFuture, that allows access to the future ``PostgresQueryResult``.
    public func query(
        _ query: PostgresQuery,
        logger: Logger,
        file: String = #fileID,
        line: Int = #line
    ) -> EventLoopFuture<PostgresQueryResult> {
        self.queryStream(query, logger: logger).flatMap { rowStream in
            rowStream.all().flatMapThrowing { rows -> PostgresQueryResult in
                guard let metadata = PostgresQueryMetadata(string: rowStream.commandTag) else {
                    throw PSQLError.invalidCommandTag(rowStream.commandTag)
                }
                return PostgresQueryResult(metadata: metadata, rows: rows)
            }
        }.enrichPSQLError(query: query, file: file, line: line)
    }

    /// Run a query on the Postgres server the connection is connected to and iterate the rows in a callback.
    ///
    /// - Note: This API does not support back-pressure. If you need back-pressure please use the query
    ///         API, that supports structured concurrency.
    /// - Parameters:
    ///   - query: The ``PostgresQuery`` to run
    ///   - logger: The `Logger` to log into for the query
    ///   - file: The file, the query was started in. Used for better error reporting.
    ///   - line: The line, the query was started in. Used for better error reporting.
    ///   - onRow: A closure that is invoked for every row.
    /// - Returns: An EventLoopFuture, that allows access to the future ``PostgresQueryMetadata``.
    public func query(
        _ query: PostgresQuery,
        logger: Logger,
        file: String = #fileID,
        line: Int = #line,
        _ onRow: @escaping (PostgresRow) throws -> ()
    ) -> EventLoopFuture<PostgresQueryMetadata> {
        self.queryStream(query, logger: logger).flatMap { rowStream in
            rowStream.onRow(onRow).flatMapThrowing { () -> PostgresQueryMetadata in
                guard let metadata = PostgresQueryMetadata(string: rowStream.commandTag) else {
                    throw PSQLError.invalidCommandTag(rowStream.commandTag)
                }
                return metadata
            }
        }.enrichPSQLError(query: query, file: file, line: line)
    }
}

// MARK: PostgresDatabase conformance

extension PostgresConnection: PostgresDatabase {
    public func send(
        _ request: PostgresRequest,
        logger: Logger
    ) -> EventLoopFuture<Void> {
        guard let command = request as? PostgresCommands else {
            preconditionFailure("\(#function) requires an instance of PostgresCommands. This will be a compile-time error in the future.")
        }

        let resultFuture: EventLoopFuture<Void>

        switch command {
        case .query(let query, let onMetadata, let onRow):
            resultFuture = self.queryStream(query, logger: logger).flatMap { stream in
                return stream.onRow(onRow).map { _ in
                    onMetadata(PostgresQueryMetadata(string: stream.commandTag)!)
                }
            }

        case .queryAll(let query, let onResult):
            resultFuture = self.queryStream(query, logger: logger).flatMap { rows in
                return rows.all().map { allrows in
                    onResult(.init(metadata: PostgresQueryMetadata(string: rows.commandTag)!, rows: allrows))
                }
            }

        case .prepareQuery(let request):
            resultFuture = self.prepareStatement(request.query, with: request.name, logger: logger).map {
                request.prepared = PreparedQuery(underlying: $0, database: self)
            }

        case .executePreparedStatement(let preparedQuery, let binds, let onRow):
            var bindings = PostgresBindings(capacity: binds.count)
            binds.forEach { bindings.append($0) }

            let statement = PSQLExecuteStatement(
                name: preparedQuery.underlying.name,
                binds: bindings,
                rowDescription: preparedQuery.underlying.rowDescription
            )

            resultFuture = self.execute(statement, logger: logger).flatMap { rows in
                return rows.onRow(onRow)
            }
        }

        return resultFuture.flatMapErrorThrowing { error in
            throw error.asAppropriatePostgresError
        }
    }

    public func withConnection<T>(_ closure: (PostgresConnection) -> EventLoopFuture<T>) -> EventLoopFuture<T> {
        closure(self)
    }
}

internal enum PostgresCommands: PostgresRequest {
    case query(PostgresQuery,
               onMetadata: (PostgresQueryMetadata) -> () = { _ in },
               onRow: (PostgresRow) throws -> ())
    case queryAll(PostgresQuery, onResult: (PostgresQueryResult) -> ())
    case prepareQuery(request: PrepareQueryRequest)
    case executePreparedStatement(query: PreparedQuery, binds: [PostgresData], onRow: (PostgresRow) throws -> ())

    func respond(to message: PostgresMessage) throws -> [PostgresMessage]? {
        fatalError("This function must not be called")
    }

    func start() throws -> [PostgresMessage] {
        fatalError("This function must not be called")
    }

    func log(to logger: Logger) {
        fatalError("This function must not be called")
    }
}

// MARK: Notifications

/// Context for receiving NotificationResponse messages on a connection, used for PostgreSQL's `LISTEN`/`NOTIFY` support.
public final class PostgresListenContext {
    var stopper: (() -> Void)?

    /// Detach this listener so it no longer receives notifications. Other listeners, including those for the same channel, are unaffected. `UNLISTEN` is not sent; you are responsible for issuing an `UNLISTEN` query yourself if it is appropriate for your application.
    public func stop() {
        stopper?()
        stopper = nil
    }
}

extension PostgresConnection {
    /// Add a handler for NotificationResponse messages on a certain channel. This is used in conjunction with PostgreSQL's `LISTEN`/`NOTIFY` support: to listen on a channel, you add a listener using this method to handle the NotificationResponse messages, then issue a `LISTEN` query to instruct PostgreSQL to begin sending NotificationResponse messages.
    @discardableResult
    public func addListener(channel: String, handler notificationHandler: @escaping (PostgresListenContext, PostgresMessage.NotificationResponse) -> Void) -> PostgresListenContext {

        let listenContext = PostgresListenContext()

        self.channel.pipeline.handler(type: PostgresChannelHandler.self).whenSuccess { handler in
            if self.notificationListeners[channel] != nil {
                self.notificationListeners[channel]!.append((listenContext, notificationHandler))
            }
            else {
                self.notificationListeners[channel] = [(listenContext, notificationHandler)]
            }
        }

        listenContext.stopper = { [weak self, weak listenContext] in
            // self is weak, since the connection can long be gone, when the listeners stop is
            // triggered. listenContext must be weak to prevent a retain cycle

            self?.channel.eventLoop.execute {
                guard
                    let self = self, // the connection is already gone
                    var listeners = self.notificationListeners[channel] // we don't have the listeners for this topic ¯\_(ツ)_/¯
                else {
                    return
                }

                assert(listeners.filter { $0.0 === listenContext }.count <= 1, "Listeners can not appear twice in a channel!")
                listeners.removeAll(where: { $0.0 === listenContext }) // just in case a listener shows up more than once in a release build, remove all, not just first
                self.notificationListeners[channel] = listeners.isEmpty ? nil : listeners
            }
        }

        return listenContext
    }
}

extension PostgresConnection: PSQLChannelHandlerNotificationDelegate {
    func notificationReceived(_ notification: PostgresBackendMessage.NotificationResponse) {
        self.eventLoop.assertInEventLoop()

        guard let listeners = self.notificationListeners[notification.channel] else {
            return
        }

        let postgresNotification = PostgresMessage.NotificationResponse(
            backendPID: notification.backendPID,
            channel: notification.channel,
            payload: notification.payload)

        listeners.forEach { (listenContext, handler) in
            handler(listenContext, postgresNotification)
        }
    }
}

enum CloseTarget {
    case preparedStatement(String)
    case portal(String)
}

extension EventLoopFuture {
    func enrichPSQLError(query: PostgresQuery, file: String, line: Int) -> EventLoopFuture<Value> {
        return self.flatMapErrorThrowing { error in
            if var error = error as? PSQLError {
                error.file = file
                error.line = line
                error.query = query
                throw error
            } else {
                throw error
            }
        }
    }
}
