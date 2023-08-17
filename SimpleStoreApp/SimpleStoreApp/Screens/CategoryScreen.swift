//
//  CategoryScreen.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import SwiftUI

struct CategoryScreen: View {
    
    var category: Category
    @State private var products = [Product]()
    @State private var viewModel = ListCategoryViewModel()
    
    var body: some View {
        List(products, id: \.id) { product in
            Text(product.title)
//                NavigationLink {
//                    CategoryScreen(category: category)
//                } label: {
//                    CategoryRowView(category: category)
//                }
        }
        .task {
            products = await viewModel.getProductsByCategory(category: category.id)
        }
    }
        
}

struct CategoryScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryScreen(category: Category(id: 1, name: "Furniture", image: "", creationAt: "", updatedAt: ""))
    }
}
