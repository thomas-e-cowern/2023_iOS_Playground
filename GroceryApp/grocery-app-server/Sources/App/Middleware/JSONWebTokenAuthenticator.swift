//
//  JSONWebTokenAuthenticator.swift
//  
//
//  Created by Thomas Cowern on 6/22/23.
//

import Foundation
import Vapor

struct JSONWebTokenAuthenticator: AsyncRequestAuthenticator {
    
    func authenticate(request: Vapor.Request) async throws {
        try request.jwt.verify(as: AuthPayload.self)
    }

}
