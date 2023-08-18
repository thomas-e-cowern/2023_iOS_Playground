//
//  ListProductsView.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import SwiftUI

struct ListProductsView: View {
    
    @State private var searchText = ""
    
    @State private var products = [Product]()
    @State private var viewModel = ListCategoryViewModel()
    
    var body: some View {
        NavigationView {
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
            return products
        } else {
            return products.filter { $0.title.contains(searchText) }
        }
    }
}

struct ListProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ListProductsView()
    }
}
