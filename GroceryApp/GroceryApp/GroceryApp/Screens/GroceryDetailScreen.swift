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
            List(1...10, id: \.self) { index in
                Text("Item \(index)")
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
    }
    
    func saveGroceryItem() async {
        
    }
}

struct GroceryDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GroceryDetailScreen(groceryCategory: GroceryCategoryResonseDTO(id: UUID(), title: "Bakery", colorCode: "#2ecc71"))
                .environmentObject(GroceryModel())
        }
    }
}
