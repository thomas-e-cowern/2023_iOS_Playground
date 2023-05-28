import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(.postgres(configuration: SQLPostgresConfiguration(hostname: "rajje.db.elephantsql.com", username: "jpokwmyd", password: "KDO8Fy68Zeh4uAsux1nzKyZLjwJ2M60p", database: "jpokwmyd",  tls: .prefer(try .init(configuration: .clientDefault)))), as: .psql)

    // register routes
    try routes(app)
}
