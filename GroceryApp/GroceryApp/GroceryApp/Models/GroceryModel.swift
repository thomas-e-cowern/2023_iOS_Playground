//
//  GroceryModel.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/8/23.
//

import Foundation

class GroceryModel: ObservableObject {
    
    func register(username: String, password: String) async throws -> Bool {
        
        let registerData = ["username": username, "password": password]
        
        let resource = Resource(url: <#T##URL#>, method: .post(try JSONEncoder().encode(registerData)), modelType: RegisterResponseDTO.self)
    }
    
}
