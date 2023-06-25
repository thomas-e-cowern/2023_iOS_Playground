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
        VStack(alignment: .leading) {
            if items.count > 0 {
                Text(category )
                    .font(.title)
                VStack (alignment: .leading) {
                    ForEach(items) { item in
                        HStack {
                            Text(item.title)
                            Text(", quantity: \(item.quantity)")
                        }
                    }
                }
                .padding(.leading, 15)
            } else {
                Text("No items")
            }
        }

    }
}

struct CategoriesAndItemsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesAndItemsView(category: "", items: [])

    }
}
