//
//  User.swift
//  
//
//  Created by Thomas Cowern on 6/6/23.
//

import Foundation
import Fluent
import Vapor

final class User: Model, Validatable {

    static var schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "username")
    var username: String
    
    @Field(key: "password")
    var password: String
    
    init() {}
    
    init(id: UUID?, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
    
    static func validations(_ validations: inout Vapor.Validations) {
        
        // Checking that username and password are not empty
        validations.add("username", as: String.self, is: !.empty, customFailureDescription: "Username cannot be empty")
        validations.add("password", as: String.self, is: !.empty, customFailureDescription: "Password cannot be empty")
        
        // Password has between 6 and 10 characters
        validations.add("password", as: String.self, is: .count(6...10), customFailureDescription: "Password must be between 6 and 10 characters")
    }
}
