//
//  ReviewListView.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI

struct ReviewListView: View {
    
    let reviews: [Review]
    
    var body: some View {
        List {
            ForEach(reviews) { review in
                VStack(alignment: .leading) {
                    Text(review.subject)
                        .font(.title2)
                        .underline()
                    Text(review.body)
                }
            }
        }
    }
}

#Preview {
    ReviewListView(reviews: [])
}
