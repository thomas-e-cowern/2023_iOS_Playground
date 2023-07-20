//
//  MovieListView.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    
    let movies: [Movie]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                HStack {
                    Text(movie.title)
                    Spacer()
                    Text("\(movie.year.description)")
                }
            }
            .onDelete(perform: deleteMovie)
        }
    }
    
    private func deleteMovie(indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movies[index]
            context.delete(movie)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    MovieListView(movies: [])
        .modelContainer(for: [Movie.self])
}
