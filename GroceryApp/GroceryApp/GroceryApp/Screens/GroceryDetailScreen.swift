//
//  GroceryDetailScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/21/23.
//

import SwiftUI
import GroceryAppSharedDTO

struct GroceryDetailScreen: View {
    
    @State private var isPresented: Bool = false
    
    @EnvironmentObject private var model: GroceryModel
    
    let groceryCategory: GroceryCategoryResonseDTO
    
    var body: some View {
        VStack {
            if model.groceryItems.isEmpty {
                Text("No \(groceryCategory.title) items found")
            } else {
                GroceryItemListView(groceryItems: model.groceryItems)
            }
        }
        .navigationTitle(groceryCategory.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add Grocery Item") {
                    isPresented = true
                }
            }
        }.sheet(isPresented: $isPresented) {
            NavigationStack {
                AddGroceryItemScreen()
            }
        }
        .onAppear {
            model.groceryCategory = groceryCategory
        }
        .task {
            await getGroceryItems()
        }
    }
    
    func saveGroceryItem() async {
        
    }
    
    func getGroceryItems() async {
        do {
            try await model.getGroceryItemsBy(groceryCategoryId: groceryCategory.id)
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct GroceryDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GroceryDetailScreen(groceryCategory: GroceryCategoryResonseDTO(id: UUID(uuidString: "6308f643-a419-4671-9393-ff81ee15eb29")!, title: "Bakery", colorCode: "#2ecc71"))
                .environmentObject(GroceryModel())
        }
    }
}
