//
//  LoginResponseDTO.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/9/23.
//

import Foundation

struct LoginResponseDTO: Codable {
    let error: Bool
    var reason: String?
    let token: String?
    let userId: UUID
}
