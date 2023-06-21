//
//  AddGroceryItemScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/21/23.
//

import SwiftUI
import GroceryAppSharedDTO

struct AddGroceryItemScreen: View {
    
    @State private var title: String = ""
    @State private var price: Double? = nil
    @State private var quantity: Int? = nil
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var model: GroceryModel
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Price", value: $price, format: .currency(code: Locale.current.currencySymbol ?? ""))
            TextField("Quantity", value: $quantity, format: .number)
        }
        .navigationTitle("New Grocery Item")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Close") {
                    // to close
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    // to save
                    Task {
                        await saveGroceryItem()
                    }
                    
                }
                .disabled(isFormValid)
            }
        }
    }
    
    private var isFormValid: Bool {
        guard let price = price, let quantity = quantity else {
            return false
        }
        return !title.isEmptyOrWhiteSpace && price > 0 && quantity > 0
    }
    
    private func saveGroceryItem() async {
        // get the selected grocery category
        guard let groceryCategory = model.groceryCategory else { return }
        
        let groceryItemRequestDTO = GroceryItemRequestDTO(title: title, price: price!, quantity: quantity!)
        
        do {
            try await model.saveGroceryItem(groceryItemRequestDTO, groceryCategoryId: groceryCategory.id)
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct AddGroceryItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddGroceryItemScreen()
                .environmentObject(GroceryModel())
        }
    }
}
