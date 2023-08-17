//
//  ListProductsView.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import SwiftUI

struct ListProductsView: View {
    
    @State private var products = [Product]()
    @State private var viewModel = ListCategoryViewModel()
    
    var body: some View {
        NavigationView {
            List(products, id: \.id) { product in
                Text(product.title)
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
}

struct ListProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ListProductsView()
    }
}
