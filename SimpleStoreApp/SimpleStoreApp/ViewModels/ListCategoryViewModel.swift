//
//  ListCategoryViewModel.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import Foundation
import SwiftUI

struct ListCategoryViewModel {
    
    var storeApi = StoreAppApi.shared
    
    func loadCategories() async  -> [Category] {
        let categories = await storeApi.loadCategories()
        return categories
    }
    
    func loadProducts() async -> [Product] {
        let products = await storeApi.getAllProducts()
        return products
    }
}
