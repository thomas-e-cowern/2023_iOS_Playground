//
//  File.swift
//  
//
//  Created by Thomas Cowern on 6/6/23.
//

import Foundation
import Fluent

struct CreateUserTableMigration: AsyncMigration {
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("users")
            .delete()
    }
    
    func prepare(on database: Database) async throws {
        try await database.schema("users")
            .id()
            .field("username", .string, .required).unique(on: "username")
            .field("password", .string, .required)
            .create()
    }
    
}
