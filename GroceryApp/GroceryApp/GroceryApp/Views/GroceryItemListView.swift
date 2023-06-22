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
    
    var body: some View {
        List {
            ForEach(groceryItems) { item in
                /*@START_MENU_TOKEN@*/Text(item.title)/*@END_MENU_TOKEN@*/
            }
        }
    }
}

struct GroceryItemListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemListView(groceryItems: [])
    }
}
