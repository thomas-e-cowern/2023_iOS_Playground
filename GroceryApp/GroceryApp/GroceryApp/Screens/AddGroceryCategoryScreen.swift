//
//  AddGroceryCategoryScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import SwiftUI

struct AddGroceryCategoryScreen: View {
    
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
        
    }
    
    private var isFormValid: Bool {
        title.isEmptyOrWhiteSpace
    }
}

struct AddGroceryCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddGroceryCategoryScreen()
        }
    }
}
