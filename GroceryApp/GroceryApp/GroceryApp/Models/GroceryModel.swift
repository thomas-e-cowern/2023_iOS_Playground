//
//  GroceryModel.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/8/23.
//

import Foundation
import GroceryAppSharedDTO

@MainActor
class GroceryModel: ObservableObject {
    
    let httpClient = HTTPClient()
    
    @Published var groceryCategories: [GroceryCategoryResonseDTO] = []
    
    @Published var groceryCategory: GroceryCategoryResonseDTO?
    
    @Published var groceryItems: [GroceryItemResponseDTO] = []
    
    func register(username: String, password: String) async throws -> RegisterResponseDTO {
        
        let registerData = ["username": username, "password": password]
        
        let resource = try Resource(url: Constants.Urls.register, method: .post(JSONEncoder().encode(registerData)), modelType: RegisterResponseDTO.self)
        let registerResponseDTO = try await httpClient.load(resource)
        
        return registerResponseDTO
    }
    
    func login(username: String, password: String) async throws -> LoginResponseDTO {
        
        let loginData = ["username": username, "password": password]
        
        let resource = try Resource(url: Constants.Urls.login, method: .post(JSONEncoder().encode(loginData)), modelType: LoginResponseDTO.self)
        
        let loginResponseDTO = try await httpClient.load(resource)
        
        if !loginResponseDTO.error && loginResponseDTO.token != nil && loginResponseDTO.userId != nil {
            // Save the token in user defaults
            let defaults = UserDefaults.standard
            defaults.set(loginResponseDTO.token, forKey: "authToken")
            defaults.set(loginResponseDTO.userId!.uuidString, forKey: "userId")
        }
        
        return loginResponseDTO
    }
    
    func saveGroceryCategory(_ groceryCategoryRequestDTO: GroceryCategoryRequestDTO) async throws {
        
        guard let userId = UserDefaults.standard.userId else {
            return
        }
        
        let resource = try Resource(url: Constants.Urls.saveGroceryCategory(userId: userId), method: .post(JSONEncoder().encode(groceryCategoryRequestDTO)), modelType: GroceryCategoryResonseDTO.self)
        
        let groceryCategory = try await httpClient.load(resource)
        // add new grocery to the list
        
        groceryCategories.append(groceryCategory)
    }
    
    func getGroceryCategories() async throws {
        
        guard let userId = UserDefaults.standard.userId else {
            return
        }
        
        let resource = Resource(url: Constants.Urls.groceryCategoriesBy(userId: userId), modelType: [GroceryCategoryResonseDTO].self)
        
        groceryCategories = try await httpClient.load(resource)
        
    }
    
    func deleteGroceryCategory(groceryCategoryId: UUID) async throws {
        
        guard let userId = UserDefaults.standard.userId else {
            return
        }
        
        let resource = Resource(url: Constants.Urls.deleteGroceryCategory(userId: userId, groceryCategoryId: groceryCategoryId), method: .delete, modelType: GroceryCategoryResonseDTO.self)
        
        let deletedGroceryCategory = try await httpClient.load(resource)
        
        groceryCategories = groceryCategories.filter {
            $0.id != deletedGroceryCategory.id
        }
    }
    
    func saveGroceryItem(_ groceryItemRequestDTO: GroceryItemRequestDTO, groceryCategoryId: UUID) async throws {
        
        guard let userId = UserDefaults.standard.userId else {
            return
        }
        
        let resource = try Resource(url: Constants.Urls.saveGroceryItem(userId: userId, groceryCategoryId: groceryCategoryId), method: .post(JSONEncoder().encode(groceryItemRequestDTO)), modelType: GroceryItemResponseDTO.self)
        print("Resource in save grocery item: \(resource)")
        
        let groceryItem = try await HTTPClient().load(resource)
        
        groceryItems.append(groceryItem)
    }
    
    func getGroceryItemsBy(groceryCategoryId: UUID) async throws {
        
        guard let userId = UserDefaults.standard.userId else {
            return
        }
        
        let resource = Resource(url: Constants.Urls.getGroceryItems(userId: userId, groceryCategoryId: groceryCategoryId), modelType: [GroceryItemResponseDTO].self)
        
        groceryItems = try await HTTPClient().load(resource)
    }
    
    func deleteGroceryItem(groceryCategoryId: UUID, groceryItemId: UUID) async throws {
        
        guard let userId = UserDefaults.standard.userId else {
            return
        }
        
    }
}
