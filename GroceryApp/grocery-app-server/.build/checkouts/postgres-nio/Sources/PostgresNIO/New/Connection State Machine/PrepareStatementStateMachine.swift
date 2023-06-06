
struct PrepareStatementStateMachine {
    
    enum State {
        case initialized(PrepareStatementContext)
        case parseDescribeSent(PrepareStatementContext)
    
        case parseCompleteReceived(PrepareStatementContext)
        case parameterDescriptionReceived(PrepareStatementContext)
        case rowDescriptionReceived
        case noDataMessageReceived
        
        case error(PSQLError)
    }
    
    enum Action {
        case sendParseDescribeSync(name: String, query: String)
        case succeedPreparedStatementCreation(PrepareStatementContext, with: RowDescription?)
        case failPreparedStatementCreation(PrepareStatementContext, with: PSQLError)

        case read
        case wait
    }
    
    var state: State
    
    init(createContext: PrepareStatementContext) {
        self.state = .initialized(createContext)
    }
    
    #if DEBUG
    /// for testing purposes only
    init(_ state: State) {
        self.state = state
    }
    #endif
    
    mutating func start() -> Action {
        guard case .initialized(let createContext) = self.state else {
            preconditionFailure("Start must only be called after the query has been initialized")
        }
        
        self.state = .parseDescribeSent(createContext)
        
        return .sendParseDescribeSync(name: createContext.name, query: createContext.query)
    }
    
    mutating func parseCompletedReceived() -> Action {
        guard case .parseDescribeSent(let createContext) = self.state else {
            return self.setAndFireError(.unexpectedBackendMessage(.parseComplete))
        }
        
        self.state = .parseCompleteReceived(createContext)
        return .wait
    }
    
    mutating func parameterDescriptionReceived(_ parameterDescription: PostgresBackendMessage.ParameterDescription) -> Action {
        guard case .parseCompleteReceived(let createContext) = self.state else {
            return self.setAndFireError(.unexpectedBackendMessage(.parameterDescription(parameterDescription)))
        }
        
        self.state = .parameterDescriptionReceived(createContext)
        return .wait
    }
    
    mutating func noDataReceived() -> Action {
        guard case .parameterDescriptionReceived(let queryContext) = self.state else {
            return self.setAndFireError(.unexpectedBackendMessage(.noData))
        }
        
        self.state = .noDataMessageReceived
        return .succeedPreparedStatementCreation(queryContext, with: nil)
    }
    
    mutating func rowDescriptionReceived(_ rowDescription: RowDescription) -> Action {
        guard case .parameterDescriptionReceived(let queryContext) = self.state else {
            return self.setAndFireError(.unexpectedBackendMessage(.rowDescription(rowDescription)))
        }
        
        self.state = .rowDescriptionReceived
        return .succeedPreparedStatementCreation(queryContext, with: rowDescription)
    }
    
    mutating func errorReceived(_ errorMessage: PostgresBackendMessage.ErrorResponse) -> Action {
        let error = PSQLError.server(errorMessage)
        switch self.state {
        case .initialized:
            return self.setAndFireError(.unexpectedBackendMessage(.error(errorMessage)))
            
        case .parseDescribeSent,
             .parseCompleteReceived,
             .parameterDescriptionReceived:
            return self.setAndFireError(error)
            
        case .rowDescriptionReceived,
             .noDataMessageReceived,
             .error:
            preconditionFailure("""
                This state must not be reached. If the prepared statement `.isComplete`, the
                ConnectionStateMachine must not send any further events to the substate machine.
                """)
        }
    }
    
    mutating func errorHappened(_ error: PSQLError) -> Action {
        return self.setAndFireError(error)
    }
    
    private mutating func setAndFireError(_ error: PSQLError) -> Action {
        switch self.state {
        case .initialized(let context),
             .parseDescribeSent(let context),
             .parseCompleteReceived(let context),
             .parameterDescriptionReceived(let context):
            self.state = .error(error)
            return .failPreparedStatementCreation(context, with: error)
        case .rowDescriptionReceived,
             .noDataMessageReceived,
             .error:
            preconditionFailure("""
                This state must not be reached. If the prepared statement `.isComplete`, the
                ConnectionStateMachine must not send any further events to the substate machine.
                """)
        }
    }
    
    // MARK: Channel actions
    
    mutating func readEventCaught() -> Action {
        return .read
    }
    
    var isComplete: Bool {
        switch self.state {
        case .rowDescriptionReceived,
             .noDataMessageReceived,
             .error:
            return true
        case .initialized,
             .parseDescribeSent,
             .parseCompleteReceived,
             .parameterDescriptionReceived:
            return false
        }
    }
    
}
