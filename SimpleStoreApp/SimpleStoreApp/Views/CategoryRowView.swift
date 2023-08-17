//
//  CategoryRowView.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import SwiftUI

struct CategoryRowView: View {
    
    var category: Category
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url:  URL(string: category.image), scale: 8)
                    .padding(.trailing, 10)
                Text(category.name)
                    .font(.headline)
            }
            
        }
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(category: Category(id: 1, name: "Category 1", image: "https://picsum.photos/640/640?r=9209", creationAt: "created", updatedAt: "updated"))
    }
}
