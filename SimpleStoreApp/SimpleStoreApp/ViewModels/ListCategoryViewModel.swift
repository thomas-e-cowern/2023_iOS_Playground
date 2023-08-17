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
        let results = await storeApi.loadCategories()
        return results
    }
}
