//
//  AddGroceryCategoryScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import SwiftUI
import GroceryAppSharedDTO

struct AddGroceryCategoryScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    
    @State private var title: String = ""
    @State private var colorCode: String = Constants.defaultColor
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            ColorSelectorView(colorCode: $colorCode)
        }
        .navigationTitle("New Category")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    Task {
                        await saveGroceryCategory()
                    }
                }
                .disabled(isFormValid)
            }
        }
    }
    
    private func saveGroceryCategory() async {
        let groceryCategoryRequestDTO = GroceryCategoryRequestDTO(title: title, colorCode: colorCode)
        do {
            try await model.saveGroceryCategory(groceryCategoryRequestDTO)
            dismiss()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    private var isFormValid: Bool {
        title.isEmptyOrWhiteSpace
    }
}



struct AddGroceryCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddGroceryCategoryScreen()
                .environmentObject(GroceryModel())
        }
    }
}
