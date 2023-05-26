//
//  File.swift
//  
//
//  Created by Thomas Cowern on 5/26/23.
//

import Foundation
import Vapor

struct LogMiddleware: AsyncMiddleware {
    func respond(to request: Vapor.Request, chainingTo next: Vapor.AsyncResponder) async throws -> Vapor.Response {
        print("Log Middleware")
        return try await next.respond(to: request)
    }
}
