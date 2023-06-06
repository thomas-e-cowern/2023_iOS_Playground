//
//  UserController.swift
//  
//
//  Created by Thomas Cowern on 6/6/23.
//

import Foundation
import Vapor
import Fluent

class UserController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        let api = routes.grouped("api")
        
        api.post("register", use: register)
    }
    
    func register(req: Request) async throws -> String {
        // validate the user
        try User.validate(content: req)
        
        let user = try req.content.decode(User.self)
        
        if let _ = try await User.query(on: req.db)
            .filter(\.$username == user.username)
            .first() {
            throw Abort(.conflict, reason: "Username is already taken")
        }
        
        // hash the password
        user.password = try await req.password.async.hash(user.password)
        
        try await user.save(on: req.db)
        
        return "Ok"
    }
    
}
