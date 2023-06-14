//
//  File.swift
//  
//
//  Created by Thomas Cowern on 6/14/23.
//

import Foundation

struct LoginResponseDTO: Codable {
    let error: Bool
    var reason: String? = nil
    var token: String? = nil
    var userId: UUID? = nil
}
