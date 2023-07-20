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
    @Environment(\.dismiss) private var dismiss
    let movie: Movie
    
    @State private var title: String = ""
    @State private var year: Int?
    @State private var showReviewScreen: Bool = false
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            Button("Update") {
                guard let year = year else { return }
                
                movie.title = title
                movie.year = year
                
                do {
                    try context.save()
                                    } catch {
                    print(error.localizedDescription.count)
                }
                
                dismiss()

            }
            .buttonStyle(.borderless)
            
            Section("Reviews") {
                Button(action: {
                    showReviewScreen = true
                }, label: {
                    Image(systemName: "plus")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                
                if let reviews = movie.reviews {
                    if reviews.isEmpty {
                        ContentUnavailableView {
                            Text("No Reviews")
                        }
                    } else {
                        ReviewListView(reviews: reviews)
                    }
                }
            }
        }
        .onAppear {
            title = movie.title
            year = movie.year
        }
        .sheet(isPresented: $showReviewScreen, content: {
            NavigationStack {
                AddReviewScreen(movie: movie)
            }
        })
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
