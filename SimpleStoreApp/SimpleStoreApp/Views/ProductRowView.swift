//
//  ProductRowView.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/18/23.
//

import SwiftUI

struct ProductRowView: View {
    
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
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
                }.frame(width: 100, height: 100, alignment: .center)
                    .font(.headline)
                Text(product.title)
                    .font(.headline)
                    .padding(.leading, 10)
            }
            
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: Product(id: 1, title: "First Product", price: 123, description: "Product descrtiption", images: [], creationAt: "CA", updatedAt: "UA", category: Category(id: 1, name: "Furniture", image: "", creationAt: "", updatedAt: "")))
    }
}
