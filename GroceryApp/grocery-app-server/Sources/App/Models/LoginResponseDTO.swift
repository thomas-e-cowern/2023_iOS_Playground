//
//  LoginResponseDTO.swift
//  
//
//  Created by Thomas Cowern on 6/7/23.
//

import Foundation
import Vapor

struct LoginResponseDTO: Content {
    
    let error: Bool
    var reason: String? = nil
    var token: String? = nil
    var userId: UUID? = nil
    
}
