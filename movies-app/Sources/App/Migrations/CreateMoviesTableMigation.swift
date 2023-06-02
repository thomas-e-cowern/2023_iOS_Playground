//
//  File.swift
//  
//
//  Created by Thomas Cowern on 6/2/23.
//

import Foundation
import Fluent

struct CreateMoviesTableMigration: AsyncMigration {
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("movies")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("movies")
            .delete()
    }
    
}
