//
//  RegisterResponseDTO.swift
//  
//
//  Created by Thomas Cowern on 6/6/23.
//

import Foundation
import Vapor

struct RegisterResponseDTO: Content {
    let error: Bool
    var reason: String? = nil
}
