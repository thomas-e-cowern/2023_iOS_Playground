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
        
        // base route
        let api = routes.grouped("api")
        
        // register
        api.post("register", use: register)
        
        // login
        api.post("login", use: login)
    }
    
    func register(req: Request) async throws -> RegisterResponseDTO {
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
        
        return RegisterResponseDTO(error: false)
    }
    
    func login(req: Request) async throws -> LoginResponseDTO {
        print("🔸🔸🔸🔸 Hit login")
        // decode request
        let user = try req.content.decode(User.self)
        print("🔸🔸🔸🔸 User: \(user)")
        // does user exist?
        guard let existingUser = try await User.query(on: req.db)
            .filter(\.$username == user.username)
            .first() else {
                throw Abort(.badRequest)
            }
        
        // validate password
        let result = try await req.password.async.verify(user.password, created: existingUser.password)
        
        if !result {
            throw Abort(.unauthorized)
        }
        
        // generate token and return
        let authPayload = try AuthPayload(expiration: .init(value: .distantFuture), userId: existingUser.requireID())
        
        return try LoginResponseDTO(error: false, token: req.jwt.sign(authPayload), userId: existingUser.requireID())
    }
}
