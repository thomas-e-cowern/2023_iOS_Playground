//
//  CategoryScreen.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import SwiftUI

struct CategoryScreen: View {
    
    var category: Category
    
    var body: some View {
        Text(category.name)
    }
}

struct CategoryScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryScreen(category: Category(id: 1, name: "Furniture", image: "", creationAt: "", updatedAt: ""))
    }
}
