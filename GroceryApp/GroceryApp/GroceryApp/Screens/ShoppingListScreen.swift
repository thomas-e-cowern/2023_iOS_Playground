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
                    VStack {
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
