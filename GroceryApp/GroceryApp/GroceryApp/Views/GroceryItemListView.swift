//
//  GroceryItemListView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/22/23.
//

import SwiftUI
import GroceryAppSharedDTO

struct GroceryItemListView: View {
    
    let groceryItems: [GroceryItemResponseDTO]
    let onDelete: (UUID) -> Void
    
    var body: some View {
        List {
            ForEach(groceryItems) { item in
                /*@START_MENU_TOKEN@*/Text(item.title)/*@END_MENU_TOKEN@*/
            }
            .onDelete(perform: deleteGroceryItem)
        }
    }
    
    func deleteGroceryItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let groceryItem = groceryItems[index]
            onDelete(groceryItem.id)
        }
    }
}

struct GroceryItemListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemListView(groceryItems: [], onDelete: { _ in })
    }
}
