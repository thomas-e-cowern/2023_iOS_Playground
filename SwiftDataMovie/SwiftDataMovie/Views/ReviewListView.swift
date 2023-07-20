//
//  ReviewListView.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI

struct ReviewListView: View {
    
    @Environment(\.modelContext) private var context
    
    let movie: Movie
    
    var body: some View {
        List {
            ForEach(movie.reviews) { review in
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
            let review = movie.reviews[index]
            context.delete(review)
            
            do {
                movie.reviews.remove(at: index)
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

//#Preview {
//    
//    let movie: Movie
//    
//    ReviewListView(movie: movie)
//        .modelContainer(for: [Movie.self])
//}
