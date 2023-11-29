//
//  ItemModel.swift
//  MvvmTest
//
//  Created by Thomas Cowern on 11/28/23.
//

import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    
    static var exampleItem = Item(name: "Example name", description: "This is a sample description")
}
