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
                ForEach(model.categoriesAndItems) { groceryCategory in
                    CategoriesAndItemsView(category: groceryCategory.title, items: groceryCategory.items)
                }
            }
        }
        .task {
            await fetchCategoriesAndItems()
        }
    }
    
    private func fetchCategoriesAndItems() async {
        do {
            try await model.getCategoriesAndItems()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ShoppingListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListScreen()
            .environmentObject(GroceryModel())
    }
}
