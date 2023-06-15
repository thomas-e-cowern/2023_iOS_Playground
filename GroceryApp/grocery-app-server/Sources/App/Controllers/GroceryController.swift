//
//  GroceryController.swift
//  
//
//  Created by Thomas Cowern on 6/15/23.
//

import Foundation
import Vapor
import Fluent

class GroceryController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        // /api/users/:userId
        let api = routes.grouped("api", "users", ":userId")
        // POST: saving groceery category
        // /api/users/:userId/grocery-categories
        api.post("grocery-categories", use: saveGroceryCategory)
    }
    
    func saveGroceryCategory(req: Request) async throws -> String {
        
        // DTO for request
        
        // DTO for reqponse
        
        return "Ok"
    }
}
