import Vapor

func routes(_ app: Application) throws {
    
    // add movie
    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movie.self)
        try await movie.save(on: req.db)
        return movie
    }
    
    // get all movies
    app.get("movies") { req async throws in
        try await Movie.query(on: req.db)
            .all()
    }
    
    // get movie by id
    app.get("movies", ":id") { req async throws in
        guard let movie = try await Movie.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.badRequest)
        }
        return movie
    }
    
    // delete a movies
    app.delete("movies", ":id") { req async throws in
        guard let movie = try await Movie.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.badRequest)
        }
        
        try await movie.delete(on: req.db)
        return movie
    }
}
