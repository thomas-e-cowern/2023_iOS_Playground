//
//  LoginResponseDTO.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/9/23.
//

import Foundation

struct LoginResponseDTO: Codable {
    let error: Bool
    var reason: String? = nil
    var token: String? = nil
    var userId: UUID? = nil
}
