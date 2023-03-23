//
//  ContentView.swift
//  NavigationSplitView
//
//  Created by Thomas Cowern on 3/23/23.
//

import SwiftUI

enum Genre: String, Hashable, CaseIterable {
    case action = "Action"
    case horror = "Horror"
    case fiction = "Fiction"
    case kids = "Kids"
    case comedy = "Comedy"
}

struct GenreListview: View {
    
    @Binding var selectedGenre: Genre?
    
    var body: some View {
        List(Genre.allCases, id: \.self, selection: $selectedGenre) { genre in
            Text(genre.rawValue)
        }
    }
}

struct GenreDetailView: View {
    let genre: Genre
    
    var body: some View {
        Text(genre.rawValue)
            .font(.system(size: 100))
    }
}

struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let genre: Genre
    
}

struct MovieListView: View {
    
    let genre: Genre
    
    let movies = [Movie(name: "Superman", genre: .action), Movie(name: "28 Days Later", genre: .horror), Movie(name: "World War Z", genre: .horror),Movie(name: "Finding Nemo", genre: .kids), Movie(name: "Ghostbusters", genre: .comedy), Movie(name: "Night Falls on Manhattan", genre: .fiction)]
    
    private var filteredMovies: [Movie] {
            movies.filter { $0.genre == genre }
        }
    
    var body: some View {
        List(filteredMovies) { movie in
            Text(movie.name)
        }
    }
}

struct ContentView: View {
    
    @State private var selectedGenre: Genre? = .action
    
    var body: some View {
        NavigationSplitView {
            GenreListview(selectedGenre: $selectedGenre)
        } detail: {
           MovieListView(genre: selectedGenre  ?? .action)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
