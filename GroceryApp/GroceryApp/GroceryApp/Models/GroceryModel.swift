//
//  GroceryModel.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/8/23.
//

import Foundation
import GroceryAppSharedDTO

class GroceryModel: ObservableObject {
    
    let httpClient = HTTPClient()
    
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
    
    func saveGroceryCategory(_ groceryCategoryRequestDTO:  GroceryCategoryRequestDTO) async throws {
        
        let defaults = UserDefaults.standard
        guard let userId = defaults.string(forKey: "userId") else {
            return
        }
        
        
    }
}
