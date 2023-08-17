//
//  StoreAppApi.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import Foundation

struct StoreAppApi {
    
    static let shared = StoreAppApi()
    
    private init() {
        
    }
    
    func loadCategories() async -> [Category] {
        
        var categories = [Category]()
        
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/categories") else {
            print("Invalid URL")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode([Category].self, from: data) {
                categories = decodedResponse
                
            }
            
            return categories
            
        } catch {
            print("Invalid Category data")
        }
        
        return []
    }
    
    func getProducts() async -> [Product] {
        
        var products = [Product]()
        
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/products/") else {
            print("Invalid URL")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode([Product].self, from: data) {
                products = decodedResponse
                
            }
            
            return products
            
        } catch {
            print("Invalid Product data")
        }
        
        return []
    }
}
