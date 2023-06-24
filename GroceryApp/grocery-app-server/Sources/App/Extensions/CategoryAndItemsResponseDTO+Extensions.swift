//
//  CategoryAndItemsResponseDTO+Extensions.swift
//  
//
//  Created by Thomas Cowern on 6/24/23.
//

import Foundation
import GroceryAppSharedDTO
import Vapor

extension CategoryAndItemsResponseDTO: Content {
    
    init?(_ groceryCategory: GroceryCategory) {
        
        guard let id = groceryCategory.id
        else {
            return nil
        }
        
        self.init(id: id, title: groceryCategory.title, colorCode: groceryCategory.colorCode, items: groceryCategory.items.compactMap(GroceryItemResponseDTO.init))
        
    }
}
