//
//  ReviewListView.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI

struct ReviewListView: View {
    
    @Environment(\.modelContext) private var context
    
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
            .onDelete(perform: deleteReview)
        }
    }
    
    private func deleteReview(indexSet: IndexSet) {
        indexSet.forEach { index in
            let review = reviews[index]
            context.delete(review)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ReviewListView(reviews: [])
        .modelContainer(for: [Review.self, Movie.self])
}
