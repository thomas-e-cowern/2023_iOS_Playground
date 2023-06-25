//
//  CategoriesAndItemsView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/25/23.
//

import SwiftUI
import GroceryAppSharedDTO

struct CategoriesAndItemsView: View {
    
    var category: String
    var items: [GroceryItemResponseDTO]
    
    var body: some View {
        Text(category )
        VStack {
            if (items.count > 0) {
                ForEach(items) { item in
                    Text(item.title)
                }
            } else {
                EmptyView()
            }
        }
    }
}

struct CategoriesAndItemsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesAndItemsView(category: "", items: [])

    }
}
