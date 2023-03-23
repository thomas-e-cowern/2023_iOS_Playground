//
//  ContentView.swift
//  NavigationStacksAPI3Vsections
//
//  Created by Thomas Cowern on 3/23/23.
//

import SwiftUI

enum Genre: String, Hashable, CaseIterable {
    case action = "Action"
    case horror = "Horror"
    case fiction = "Fiction"
    case kids = "Kids"
}

struct GenreListView: View {
    
    @Binding var selectedGenre: Genre?
    
    var body: some View {
        List(Genre.allCases, id: \.self, selection: $selectedGenre) { genre in
            Text(genre.rawValue)
        }
    }
}

struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let genre: Genre
    
}

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        Text(movie.name)
            .font(.largeTitle)
    }
}

struct MovieListView: View {
    
    let genre: Genre
        
    let movies = [Movie(name: "Superman", genre: .action), Movie(name: "28 Days Later", genre: .horror), Movie(name: "World War Z", genre: .horror),Movie(name: "Finding Nemo", genre: .kids)]
    
    private var filteredMovies: [Movie] {
        movies.filter { $0.genre == genre }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredMovies) { movie in
                NavigationLink(movie.name) {
                    MovieDetailView(movie: movie)
                }
            }
        }
    }
    
}

struct ContentView: View {
    
    @State private var selectedGenre: Genre? = .action
    
    var body: some View {
        NavigationSplitView {
            GenreListView(selectedGenre: $selectedGenre)
        } detail: {
            MovieListView(genre: selectedGenre ?? .action)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

