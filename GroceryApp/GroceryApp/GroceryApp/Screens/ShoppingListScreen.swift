//
//  ShoppingListScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/25/23.
//

import SwiftUI

struct ShoppingListScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    
    var body: some View {
        VStack {
            List {
                ForEach(model.groceryCategories) { groceryCategory in
                    HStack {
                        Circle()
                            .fill(Color.fromHex(groceryCategory.colorCode))
                            .frame(width: 25)
                        Text(groceryCategory.title)
                    }
                }
            }
        }
    }
}

struct ShoppingListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListScreen()
            .environmentObject(GroceryModel())
    }
}
