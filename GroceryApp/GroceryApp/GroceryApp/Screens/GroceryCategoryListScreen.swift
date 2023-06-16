//
//  GroceryCategoryListScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import SwiftUI

struct GroceryCategoryListScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            ForEach(model.groceryCategories) { category in
                HStack {
                    Circle()
                        .fill(Color.fromHex(category.colorCode))
                        .frame(width: 25)
                    Text(category.title)
                }
            }
            .onDelete(perform: deleteGroceryCategory)
            
        }
        .task {
            await fetchGroceryCategories()
        }
        .navigationTitle("Categories")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Log Out") {
                    
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $isPresented) {
                    NavigationStack {
                        AddGroceryCategoryScreen()
                    }
                }

            }
        }
    }
    
    private func fetchGroceryCategories() async {
        do {
            try await model.getGroceryCategories()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func deleteGroceryCategory(at offsets: IndexSet) {
        offsets.forEach { index in
            let groceryCategory = model.groceryCategories[index]
            
            Task {
                do {
                    try await model.deleteGroceryCategory(groceryCategoryId: groceryCategory.id)
                } catch {
                    print(error.localizedDescription)
                }
            }
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
