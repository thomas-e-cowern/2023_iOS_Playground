//
//  Order.swift
//  CoffeeApp
//
//  Created by Thomas Cowern on 5/22/23.
//

import Foundation

enum CoffeSize: String, Codable, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

struct Order: Codable, Identifiable, Hashable {
    
    var id: Int?
    var name: String?
    var coffeeName: String
    var total: Double
    var size: CoffeSize
    
}
