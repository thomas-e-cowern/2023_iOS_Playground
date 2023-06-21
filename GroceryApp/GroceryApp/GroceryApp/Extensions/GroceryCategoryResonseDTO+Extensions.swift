//
//  GroceryCategoryResonseDTO+Extensions.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import Foundation
import GroceryAppSharedDTO

extension GroceryCategoryResonseDTO: Identifiable, Hashable {
    
    public static func == (lhs: GroceryCategoryResonseDTO, rhs: GroceryCategoryResonseDTO) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    

}
