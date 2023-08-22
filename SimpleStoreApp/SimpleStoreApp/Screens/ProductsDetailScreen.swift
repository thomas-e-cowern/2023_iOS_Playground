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
            
            HStack {
                Spacer()
                Text(product.category.name)
                    .padding(.bottom, 12)
                Spacer()
            }
            .background(Color.red.opacity(0.5))
            
            Spacer()
                .frame(width: .infinity, height: 50, alignment: .center)
                
            
            HStack (alignment: .center) {
                
                Spacer()
                AsyncImage(url: URL(string: product.images[0])!) { phase in // 1
                    if let image = phase.image { // 2
                        // if the image is valid
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    } else if phase.error != nil { // 3
                        // some kind of error appears
                        Text("No image available")
                    } else {
                        //appears as placeholder image
                        Image(systemName: "photo") // 4
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                    .frame(width: 250, height: 250, alignment: .center)
                    .font(.headline)
                    .cornerRadius(12)
                Spacer()
            }
            .padding(.bottom, 24)
            
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
        Spacer()
    }
}

struct ProductsDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductsDetailScreen(product: Product(id: 1, title: "First Product", price: 123, description: "Product descrtiption", images: [], creationAt: "CA", updatedAt: "UA", category: Category(id: 1, name: "Furniture", image: "", creationAt: "", updatedAt: "")))
    }
}
