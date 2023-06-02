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
}
