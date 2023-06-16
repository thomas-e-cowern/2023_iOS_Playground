//
//  GroceryCategoryListScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import SwiftUI

struct GroceryCategoryListScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    
    var body: some View {
        List(model.groceryCategories) { category in
            
        }
    }
}

struct GroceryCategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        GroceryCategoryListScreen()
            .environmentObject(GroceryModel())
    }
}
