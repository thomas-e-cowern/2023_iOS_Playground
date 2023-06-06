extension Application {
    public var views: Views {
        .init(application: self)
    }

    public var view: ViewRenderer {
        guard let makeRenderer = self.views.storage.makeRenderer else {
            fatalError("No renderer configured. Configure with app.views.use(...)")
        }
        return makeRenderer(self)
    }

    public struct Views {
        public struct Provider {
            public static var plaintext: Self {
                .init {
                    $0.views.use { $0.views.plaintext }
                }
            }

            let run: (Application) -> ()

            public init(_ run: @escaping (Application) -> ()) {
                self.run = run
            }
        }
        
        final class Storage {
            var makeRenderer: ((Application) -> ViewRenderer)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public var plaintext: PlaintextRenderer {
            return .init(
                fileio: self.application.fileio,
                viewsDirectory: self.application.directory.viewsDirectory,
                logger: self.application.logger,
                eventLoopGroup: self.application.eventLoopGroup
            )
        }

        public func use(_ provider: Provider) {
            provider.run(self.application)
        }

        public func use(_ makeRenderer: @escaping (Application) -> (ViewRenderer)) {
            self.storage.makeRenderer = makeRenderer
        }

        func initialize() {
            self.application.storage[Key.self] = .init()
            self.use(.plaintext)
        }

        var storage: Storage {
            guard let storage = self.application.storage[Key.self] else {
                fatalError("Views not configured. Configure with app.views.initialize()")
            }
            return storage
        }
    }
}
