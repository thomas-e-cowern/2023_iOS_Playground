//
//  ListCategoriesScreen.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import SwiftUI

struct ListCategoriesScreen: View {
    
    @State private var categories = [Category]()
    @State private var viewModel = ListCategoryViewModel()
    
    var body: some View {
        NavigationView {
            List(categories, id: \.id) { category in
                NavigationLink {
                    CategoryScreen(category: category)
                } label: {
                    CategoryRowView(category: category)
                }
            }
            .task {
                categories = await viewModel.loadData()
            }
        }
    }
}

struct ListCategoriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListCategoriesScreen()
    }
}
