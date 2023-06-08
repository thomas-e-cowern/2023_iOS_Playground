//
//  GroceryModel.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/8/23.
//

import Foundation

class GroceryModel: ObservableObject {
    
    let httpClient = HTTPClient()
    
    func register(username: String, password: String) async throws -> Bool {
        
        let registerData = ["username": username, "password": password]
        
        let resource = try Resource(url: Constants.Urls.register, method: .post(JSONEncoder().encode(registerData)), modelType: RegisterResponseDTO.self)
        let registerResponseDTO = try await httpClient.load(resource)
        
        return registerResponseDTO.error
    }
    
}
