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
    
    @State private var searchText = ""
    
    @State private var products = [Product]()
    @State private var viewModel = ListCategoryViewModel()
    
    var body: some View {
        VStack {
            List(searchResults, id: \.id) { product in
                    NavigationLink {
                        ProductsDetailScreen(product: product)
                    } label: {
                        ProductRowView(product: product)
                    }
                }
                .task {
                    products = await viewModel.loadProducts()
            }
        }
        .searchable(text: $searchText)
    }
        
    var searchResults: [Product] {
        if searchText.isEmpty {
            return filteredProducts
        } else {
            return filteredProducts.filter { $0.title.contains(searchText) }
        }
    }
}

struct CategoryScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryScreen(category: Category(id: 1, name: "Furniture", image: "", creationAt: "", updatedAt: ""))
    }
}
