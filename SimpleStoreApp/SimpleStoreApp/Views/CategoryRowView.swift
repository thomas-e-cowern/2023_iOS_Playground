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
                AsyncImage(url: URL(string: category.image)!) { phase in // 1
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
                Text(category.name)
                    .font(.headline)
                    .padding(.leading, 10)
            }
            
        }
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(category: Category(id: 1, name: "Category 1", image: "https://picsum.photos/640/640?r=9209", creationAt: "created", updatedAt: "updated"))
    }
}
