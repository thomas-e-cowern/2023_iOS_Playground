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
        
        // /api/users/:userId[Protected routes]
        let api = routes.grouped("api", "users", ":userId").grouped(JSONWebTokenAuthenticator())
        
        
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
        
        //GET /api/users/:userId/grocery-caategories/:groceryCategoryId/grocery-items
        api.get("grocery-categories", ":groceryCategoryId", "grocery-items", use: getGroceryItemsByGroceryCategory)
        
        //DELETE /api/users/:userId/grocery-caategories/:groceryCategoryId/grocery-items
        api.delete("grocery-categories", ":groceryCategoryId", "grocery-items", ":groceryItemId",  use: deleteGroceryItem)
        
        // Get categories and items
        //GET /api/users/:userId/grocery-caategories-and-items
        api.get("grocery-categories-and-items", use: getGroceryCategoriesAndItems)
        
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
        
        let groceryItem = GroceryItem(title: groceryItemRequestDTO.title, price: groceryItemRequestDTO.price, quantity: groceryItemRequestDTO.quantity, groceryCategoryId: groceryCategory.id!)
        
        try await groceryItem.save(on: req.db)
        
        guard let groceryItemResponseDTO = GroceryItemResponseDTO(groceryItem) else {
            throw Abort(.internalServerError)
        }
        
        return groceryItemResponseDTO
    }
    
    func getGroceryItemsByGroceryCategory(req: Request) async throws -> [GroceryItemResponseDTO] {
        
        // get the userId
        guard let userId = req.parameters.get("userId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        // get the grocery category ID
        guard let groceryCategoryId = req.parameters.get("groceryCategoryId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        // Check userId is valid
        guard let _ = try await User.find(userId, on: req.db) else {
            throw Abort(.notFound)
        }
        
        guard let groceryCategory = try await GroceryCategory.query(on: req.db)
            .filter(\.$user.$id == userId)
            .filter(\.$id == groceryCategoryId)
            .first() else {
            throw Abort(.notFound)
        }
        
        return try await GroceryItem.query(on: req.db)
            .filter(\.$groceryCategory.$id == groceryCategory.id!)
            .all()
            .compactMap(GroceryItemResponseDTO.init)
        
    }
    
    func deleteGroceryItem(req: Request) async throws -> GroceryItemResponseDTO {
        
        // get id's from the route
        guard let userId = req.parameters.get("userId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let groceryCategoryId = req.parameters.get("groceryCategoryId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let groceryItemId = req.parameters.get("groceryItemId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        // check category exists and belongs to the user
        guard let groceryCategory = try await GroceryCategory.query(on: req.db)
            .filter(\.$user.$id == userId)
            .filter(\.$id == groceryCategoryId)
            .first() else {
            throw Abort(.notFound)
        }
        
        guard let groceryItem = try await GroceryItem.query(on: req.db)
            .filter(\.$id == groceryItemId)
            .filter(\.$groceryCategory.$id == groceryCategory.id!)
            .first() else {
                throw Abort(.notFound)
        }
        
        try await groceryItem.delete(on: req.db)
        
        guard let groceryItemResponseDTO = GroceryItemResponseDTO(groceryItem) else {
            throw Abort(.internalServerError)
        }
        
        return groceryItemResponseDTO
    }
    
    func getGroceryCategoriesAndItems(req: Request) async throws -> [GroceryCategoryResonseDTO] {
        
        guard let userId = req.parameters.get("userId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        return try await GroceryCategory.query(on: req.db)
            .filter(\.$user.$id == userId)
            .with(\.$items)
            .all()
            .compactMap(GroceryCategoryResonseDTO.init)
    }
}
