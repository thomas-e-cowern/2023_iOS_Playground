//
//  MovieListScreen.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    
    @Query(sort: \.title, order: .reverse, animation: .default) private var movies: [Movie]
    
    @State private var isAddMoviePresented: Bool = false
    
    var body: some View {
        List(movies) { movie in
            Text(movie.title)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    isAddMoviePresented = true
                }
            }
        })
        .sheet(isPresented: $isAddMoviePresented, content: {
            NavigationStack {
                AddMovieScreens()
            }
        })
        .navigationTitle("Add Movie")
    }
}

#Preview {
    MovieListScreen()
        .modelContainer(for: [Movie.self])
}
