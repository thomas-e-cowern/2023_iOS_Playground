//
//  MovieListView.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    
    @Query private var movies: [Movie]
    let filterOption: FilterOption
    
    init(filterOption: FilterOption = .none) {
        self.filterOption = filterOption
        
        switch self.filterOption {
        case .title(let movieTitle):
            _movies = Query(filter: #Predicate{ $0.title.contains(movieTitle) })
        case .none:
            _movies = Query()
        }
    }
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink(value: movie) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(movie.title)
                            Text("Number of reviews: \(movie.reviews.count)")
                                .font(.caption)
                            Text("Number of actors: \(movie.actors.count)")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(movie.year.description)")
                    }
                }
            }
            .onDelete(perform: deleteMovie)
        }
        .navigationDestination(for: Movie.self) { movie in
            MovieDetailScreen(movie: movie)
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
    MovieListView(filterOption: .none)
        .modelContainer(for: [Movie.self])
}
