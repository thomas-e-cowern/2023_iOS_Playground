//
//  GroceryController.swift
//  
//
//  Created by Thomas Cowern on 6/15/23.
//

import Foundation
import Vapor
import Fluent
import GroceryAppSharedDTO

class GroceryController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        // /api/users/:userId
        let api = routes.grouped("api", "users", ":userId")
        // POST: saving groceery category
        // /api/users/:userId/grocery-categories
        api.post("grocery-categories", use: saveGroceryCategory)
    }
    
    func saveGroceryCategory(req: Request) async throws -> GroceryCategoryResonseDTO {
        
        // Get the user id
        guard let userId = req.parameters.get("userId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        // DTO for request
        let groceryCategoryRequestDTO = try req.content.decode(GroceryCategoryResonseDTO.self)
        
        let groceryCategory = GroceryCategory(title: groceryCategoryRequestDTO.title, colorCode: groceryCategoryRequestDTO.colorCode, userId: userId)
        
        try await groceryCategory.save(on: req.db)
        
        guard let groceryCategoryResponseDTO = GroceryCategoryResonseDTO(groceryCategory) else {
            throw Abort(.internalServerError)
        }
        
        // DTO for reqponse
        return groceryCategoryResponseDTO
    }
}
