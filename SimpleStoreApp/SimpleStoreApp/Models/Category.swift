//
//  Category.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import Foundation

struct Category: Codable, Identifiable {
    
    var id: Int
    var name: String
    var image: String
    var creationAt: String
    var updatedAt: String

}
