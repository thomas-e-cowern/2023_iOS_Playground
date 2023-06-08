//
//  RegisterResponseDTO.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/8/23.
//

import Foundation

struct RegisterResponseDTO: Codable {
    let error: Bool
    let reason: String? = nil
}
