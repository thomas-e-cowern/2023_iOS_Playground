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

import Foundation
import Vapor
import GroceryAppSharedDTO

class GroceryController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        // /api/users/:userId
        let api = routes.grouped("api", "users", ":userId")
        
        
        // POST: Saving GroceryCategory
        // /api/users/:userId/grocery-categories
        api.post("grocery-categories", use: saveGroceryCategory)
        
        // Get all categories for a user
        // GET: /api/users/:userId/grocery-categories
        
        api.get("grocery-categories", use: getGroceryCategoriesByUser)
        
        // Delete /api/users/:userId/grocery-categories/:groceryCategoryId
        
        api.delete("grocery-categories", ":groceryCategoryId", use: deleteGroceryCategory)
        
        //POST /api/users/:userId/grocery-caategories/:groceryCategoryId/grocery-items
        api.post("grocery-categories", ":groceryCategoryId", "grocery-items", use: saveGroceryItem)
    }
    
    func saveGroceryCategory(req: Request) async throws -> GroceryCategoryResonseDTO {
        
        // get the userId
        guard let userId = req.parameters.get("userId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        // DTO for the request
        let groceryCategoryRequestDTO = try req.content.decode(GroceryCategoryRequestDTO.self)
        
        let groceryCategory = GroceryCategory(title: groceryCategoryRequestDTO.title, colorCode: groceryCategoryRequestDTO.colorCode, userId: userId)
        
        try await groceryCategory.save(on: req.db)
        
        guard let groceryCategoryResponseDTO = GroceryCategoryResonseDTO(groceryCategory) else {
            throw Abort(.internalServerError)
        }
        
        // DTO for the response
        return groceryCategoryResponseDTO
    }
    
    func getGroceryCategoriesByUser(req: Request) async throws -> [GroceryCategoryResonseDTO] {
        
        // get the userId
        guard let userId = req.parameters.get("userId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        return try await GroceryCategory.query(on: req.db)
            .filter(\.$user.$id == userId)
            .all()
            .compactMap(GroceryCategoryResonseDTO.init)
    }
    
    func deleteGroceryCategory(req: Request) async throws -> GroceryCategoryResonseDTO {
        
        guard let userId = req.parameters.get("userId", as: UUID.self), let groceryCategoryId = req.parameters.get("groceryCategoryId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let groceryCategory = try await GroceryCategory.query(on: req.db)
            .filter(\.$user.$id == userId)
            .filter(\.$id == groceryCategoryId)
            .first() else {
                throw Abort(.notFound)
            }
        
        try await groceryCategory.delete(on: req.db)
        
        guard let groceryCategoryResponseDTO = GroceryCategoryResonseDTO(groceryCategory) else {
            throw Abort(.internalServerError)
        }
        
        return groceryCategoryResponseDTO
    }
    
    func saveGroceryItem(req: Request) async throws -> GroceryItemResponseDTO {
        
        // get the userId
        guard let userId = req.parameters.get("userId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        // get the grocery category ID
        guard let groceryCategoryId = req.parameters.get("groceryCategoryId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        // find the user
        guard let _ = try await User.find(userId, on: req.db) else {
            throw Abort(.notFound)
        }
        
        // find the grocery category
        guard let groceryCategory = try await GroceryCategory.query(on: req.db)
            .filter(\.$user.$id == userId)
            .filter(\.$id == groceryCategoryId)
            .first() else {
            throw Abort(.notFound)
        }
        
        // decoding GroceryItemRequestDTO
        let groceryItemRequestDTO = try req.content.decode(GroceryItemRequestDTO.self)
        
        let groceryItem = GroceryItem(title: groceryItemRequestDTO.title, price: groceryItemRequestDTO.price, quantity: groceryItemRequestDTO.quantity, groceryCategoryId: groceryCategoryId)
        
        try await groceryItem.save(on: req.db)
        
        guard let groceryItemResponseDTO = GroceryItemResponseDTO(groceryItem) else {
            throw Abort(.internalServerError)
        }
        
        return groceryItemResponseDTO
    }
    
}
