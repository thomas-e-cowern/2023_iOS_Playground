//
//  Product.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import Foundation

struct Product: Codable, Identifiable {
    
    var id: Int
    var title: String
    var price: Int
    var description: String
    var images: [String]
    var creationAt: String
    var updatedAt: String
    var category: ProductCategory
    
}
