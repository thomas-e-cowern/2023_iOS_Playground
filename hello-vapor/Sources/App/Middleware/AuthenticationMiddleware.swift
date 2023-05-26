//
//  AuthenticationMiddleware.swift
//  
//
//  Created by Thomas Cowern on 5/26/23.
//

import Foundation
import Vapor

struct AuthenticationMiddleware: AsyncMiddleware {
    func respond(to request: Vapor.Request, chainingTo next: Vapor.AsyncResponder) async throws -> Vapor.Response {
        
        guard let authorization = request.headers.bearerAuthorization else {
            throw Abort(.unauthorized)
        }
        
        print(authorization.token)
        return try await next.respond(to: request)
    }
    
    
}
