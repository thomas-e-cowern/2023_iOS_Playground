//
//  Restroom.swift
//  SwiftUIMap
//
//  Created by Thomas Cowern on 8/23/23.
//

import Foundation

struct Restroom: Identifiable, Codable {
    let id: Int
    let name: String
    let city: String
    let street: String
    let state: String
    let directions: String
    let latitude: Double
    let longitude: Double
}
