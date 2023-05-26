import Vapor

func routes(_ app: Application) throws {
    
    try app.register(collection: MoviesController())
    
    app.middleware.use(LogMiddleware())
//    app.get { req async in
//        "It works!"
//    }
//
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }
//
//    app.get("hotels") { req async throws in
//        let hotelQuery = try req.query.decode(HotelQuery.self)
//        return hotelQuery
//    }
//
//    app.post("movies") { req async throws in
//        let movie = try req.content.decode(Movie.self)
//        return movie
//    }
//
//    app.get("movies", ":genre") { req async throws -> String in
//        guard let genre = req.parameters.get("genre") else {
//            throw Abort(.badRequest)
//        }
//        return "All movies of genre: \(String(describing: genre))"
//    }
//
//    app.get("movies", ":genre", ":year") { req async throws -> String in
//        guard let genre = req.parameters.get("genre"),
//              let year = req.parameters.get("year")
//        else {
//            throw Abort(.badRequest)
//        }
//
//        return "All movies of genre \(genre) in \(year)"
//    }
//
//    app.get("customers", ":customerId") { req async throws -> String in
//
//        guard let customerId = req.parameters.get("customerId", as: Int.self) else {
//            throw Abort(.badRequest)
//        }
//
//        return "\(customerId)"
//    }
//
//    app.get("movies") { req async in
//        [
//            Movie(title: "The Big Year", year: 2015),
//            Movie(title: "Frankenstien", year: 1993),
//            Movie(title: "Bill and Ted", year: 1990)
//        ]
//    }
}
