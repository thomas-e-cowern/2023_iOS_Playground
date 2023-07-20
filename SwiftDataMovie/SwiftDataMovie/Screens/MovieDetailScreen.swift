//
//  MovieDetailScreen.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI
import SwiftData

struct MovieDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    let movie: Movie
    
    @State private var title: String = ""
    @State private var year: Int?
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
        }
        .onAppear {
            title = movie.title
            year = movie.year
        }
    }
}

struct MovieDetalContainerScreen: View {
    
    @Environment(\.modelContext) private var context
    @State private var movie: Movie?
    
    var body: some View {
        ZStack {
            if let movie {
                MovieDetailScreen(movie: movie)
            }
        }
        .onAppear {
                movie = Movie(title: "Spiderman", year: 2002)
                context.insert(movie!)
        }
    }
}

#Preview {
    MovieDetalContainerScreen()
        .modelContainer(for: [Movie.self])
}
