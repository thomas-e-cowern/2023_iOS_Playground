import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("movies", ":genre") { req async throws -> String in
        guard let genre = req.parameters.get("genre") else {
            throw Abort(.badRequest)
        }
        return "All movies of genre: \(String(describing: genre))"
    }
    
    app.get("movies", ":genre", ":year") { req async throws -> String in
        guard let genre = req.parameters.get("genre"),
              let year = req.parameters.get("year")
        else {
            throw Abort(.badRequest)
        }
        
        return "All movies of genre \(genre) in \(year)"
    }
    
    app.get("customers", ":customerId") { req async throws -> String in
    
        guard let customerId = req.parameters.get("customerId", as: Int.self) else {
            throw Abort(.badRequest)
        }
        
        return "\(customerId)"
    }
}
