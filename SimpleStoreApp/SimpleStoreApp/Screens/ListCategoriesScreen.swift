//
//  ListCategoriesScreen.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import SwiftUI

struct ListCategoriesScreen: View {
    
    @State private var results = [Category]()
    @State private var viewModel = ListCategoryViewModel()
    
    var body: some View {
        List(results, id: \.id) { item in
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url:  URL(string: item.image), scale: 8)
                        .padding(.trailing, 10)
                    Text(item.name)
                        .font(.headline)
                }
                
            }
        }
        .task {
            results = await viewModel.loadData()
        }
    }
}

struct ListCategoriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListCategoriesScreen()
    }
}
