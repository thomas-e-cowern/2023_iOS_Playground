//
//  File.swift
//  
//
//  Created by Thomas Cowern on 6/21/23.
//

import Foundation
import Fluent

class CreateGroceryItemTableMigration: AsyncMigration {
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("grocery_items")
            .delete()
    }
    
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("grocery_items")
            .id()
            .field("title", .string, .required)
            .field("price", .double, .required)
            .field("quantity", .int, .required)
            .field("grocery_category_id", .uuid, .required, .references("grocery_categories", "id", onDelete: .cascade))
            .create()
    }
}
