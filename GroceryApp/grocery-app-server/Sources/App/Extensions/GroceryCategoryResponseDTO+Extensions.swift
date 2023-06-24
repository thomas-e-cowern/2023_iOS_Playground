//
//  GroceryCategoryResponseDTO+Extensions.swift
//  
//
//  Created by Thomas Cowern on 6/15/23.
//

import Foundation
import GroceryAppSharedDTO
import Vapor

extension GroceryCategoryResonseDTO: Content {
    
    init?(_ groceryCategory: GroceryCategory) {
        
        guard let id = groceryCategory.id
        else {
            return nil
        }
        
        self.init(id: id, title: groceryCategory.title, colorCode: groceryCategory.colorCode)
    }
    
}
