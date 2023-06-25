//
//  CategoriesAndItemsDetailView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/25/23.
//

import SwiftUI

struct CategoriesAndItemsDetailView: View {
    
    var title: String
    var quantity: Int
    var price: Double
    
    var body: some View {
        HStack {
            Text(title)
            Text("Qty: \(quantity)")
            Text("Price: \(price, specifier: "%.2f")")
        }
    }
}

struct CategoriesAndItemsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesAndItemsDetailView(title: "Bread", quantity: 1, price: 2.45)
    }
}
