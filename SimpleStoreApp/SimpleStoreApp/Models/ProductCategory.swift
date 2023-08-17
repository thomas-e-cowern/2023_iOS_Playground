//
//  ProductCategory.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import Foundation

struct ProductCategory: Codable, Identifiable {
    
    var id: Int
    var name: String
    var image: String
    var createdAt: String
    var updatedAt: String
    
}
