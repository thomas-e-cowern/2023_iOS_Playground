//
//  ProductsDetailScreen.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/18/23.
//

import SwiftUI

struct ProductsDetailScreen: View {
    
    var product: Product
    
    var priceAsString: String {
        return product.price.formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack() {
                Text(product.title)
                    .font(.headline)
                    .padding(.leading, 10)
                Spacer()
                Text("Price: \(priceAsString)")
                    .padding(.trailing)
            }
            
            Text(product.description)
                .padding(.leading, 10)
        }
    }
}

struct ProductsDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductsDetailScreen(product: Product(id: 1, title: "First Product", price: 123, description: "Product descrtiption", images: [], creationAt: "CA", updatedAt: "UA", category: Category(id: 1, name: "Furniture", image: "", creationAt: "", updatedAt: "")))
    }
}
