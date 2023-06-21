//
//  GroceryItemResponseDTO+Extensions.swift
//  
//
//  Created by Thomas Cowern on 6/21/23.
//

import Foundation
import GroceryAppSharedDTO
import Vapor

extension GroceryItemResponseDTO: Content {
    
    init?(_ groceryItem: GroceryItem) {
        guard let groceryItemId = groceryItem.id else {
            return nil
        }
        
        self.init(id: groceryItemId, title: groceryItem.title, price: groceryItem.price, quantity: groceryItem.quantity)
    }
}
