//
//  CategoryScreen.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import SwiftUI

struct CategoryScreen: View {
    
    var category: Category
    
    var filteredProducts: [Product] {
        return products.filter { $0.category.name == category.name }
    }
    
    @State private var products = [Product]()
    @State private var viewModel = ListCategoryViewModel()
    
    var body: some View {
        List(filteredProducts, id: \.id) { product in
            Text(product.title)
                .font(.headline)
//                NavigationLink {
//                    CategoryScreen(category: category)
//                } label: {
//                    CategoryRowView(category: category)
//                }
        }
        .task {
            products = await viewModel.loadProducts()
        }
    }
        
}

struct CategoryScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryScreen(category: Category(id: 1, name: "Furniture", image: "", creationAt: "", updatedAt: ""))
    }
}
