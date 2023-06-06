import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(.postgres(configuration: SQLPostgresConfiguration(hostname: "localhost", username: "postgres", database: "grocerydb", tls: .prefer(try.init(configuration: .clientDefault)))), as: .psql)
    
    // register migrations
    app.migrations.add(CreateUserTableMigration())
    
    // register cotrollers
    try app.register(collection: UserController())
    
    // register routes
    try routes(app)
}
