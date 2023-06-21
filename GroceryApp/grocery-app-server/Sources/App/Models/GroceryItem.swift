//
//  GroceryItem.swift
//  
//
//  Created by Thomas Cowern on 6/21/23.
//

import Foundation
import Vapor
import Fluent

final class GroceryItem: Model, Content, Validatable {
    
    static let schema = "grocery_items"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "price")
    var price: Double
    
    @Field(key: "quantity")
    var quantity: Int
    
    @Parent(key: "grocery_category_id")
    var groceryCategory: GroceryCategory
    
    init() { }
    
    init(id: UUID? = nil, title: String, price: Double, quantity: Int, groceryCategoryId: UUID) {
        self.id = id
        self.title = title
        self.price = price
        self.quantity = quantity
        self.$groceryCategory.id = groceryCategoryId
    }
    
    static func validations(_ validations: inout Vapor.Validations) {
        validations.add("title", as: String.self, is: !.empty, customFailureDescription: "Title cannot be empty.")
        validations.add("price", as: String.self, is: !.empty, customFailureDescription: "Price cannot be empty.")
        validations.add("quantity", as: String.self, is: !.empty, customFailureDescription: "Quantity cannot be empty")
    }
    
}
