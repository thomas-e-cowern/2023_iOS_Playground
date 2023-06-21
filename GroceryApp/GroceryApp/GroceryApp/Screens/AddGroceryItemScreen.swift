//
//  AddGroceryItemScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/21/23.
//

import SwiftUI

struct AddGroceryItemScreen: View {
    
    @State private var title: String = ""
    @State private var price: Double? = nil
    @State private var quantity: Int? = nil
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Price", text: $price)
            TextField("Quantity", text: $quantity)
        }
    }
}

struct AddGroceryItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddGroceryItemScreen()
    }
}
