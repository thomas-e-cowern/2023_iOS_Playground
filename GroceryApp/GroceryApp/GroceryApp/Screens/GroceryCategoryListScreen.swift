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
            HStack {
                Circle()
                    .fill(Color.fromHex(category.colorCode))
                    .frame(width: 25)
                Text(category.title)
            }
        }
        .task {
            await fetchGroceryCategories()
        }
        .navigationTitle("Categories")
    }
    
    private func fetchGroceryCategories() async {
        do {
            try await model.getGroceryCategories()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct GroceryCategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GroceryCategoryListScreen()
                .environmentObject(GroceryModel())
        }
    }
}
