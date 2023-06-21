import Vapor
import Fluent
import FluentPostgresDriver
import JWT

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(.postgres(configuration: SQLPostgresConfiguration(hostname: "localhost", username: "postgres", database: "grocerydb", tls: .prefer(try.init(configuration: .clientDefault)))), as: .psql)
    
    // register migrations
    app.migrations.add(CreateUserTableMigration())
    app.migrations.add(CreateGroceryCategoryTableMigration())
    app.migrations.add(CreateGroceryItemTableMigration())
    
    // register cotrollers
    try app.register(collection: UserController())
    try app.register(collection: GroceryController())
    
    app.jwt.signers.use(.hs256(key: "SECRETKEY"))
    
    // register routes
    try routes(app)
}
