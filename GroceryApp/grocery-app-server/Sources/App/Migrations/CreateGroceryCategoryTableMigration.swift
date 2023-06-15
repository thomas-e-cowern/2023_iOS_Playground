//
//  File.swift
//  
//
//  Created by Thomas Cowern on 6/15/23.
//

import Foundation
import Fluent

class CreateGroceryCategoryTableMigration: AsyncMigration {
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("grocery_categories")
            .delete()
    }
    
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("grocery_categories")
            .id()
            .field("title", .string, .required)
            .field("color_code", .string, .required)
            .field("user_id", .uuid, .required, .references("users", "id"))
            .create()
    }

}

