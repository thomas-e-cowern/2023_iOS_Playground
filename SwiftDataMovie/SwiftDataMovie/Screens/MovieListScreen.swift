//
//  MovieListScreen.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI
import SwiftData

enum Sheets: Identifiable {
    case addMovie
    case addActor
    case showFilter
    
    var id: Int {
        hashValue
    }
}

struct MovieListScreen: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(sort: \.title, order: .reverse, animation: .default) private var movies: [Movie]
    @Query(sort: \.name, order: .forward) private var actors: [Actor]
//    @Query(filter: #Predicate { $0.title.contains("Iron man")}, animation: .bouncy) private var movies: [Movie]

    @State private var actorName: String = ""
    @State private var activeSheet: Sheets?
    @State private var filterOption: FilterOption = .none
    
    var body: some View {

        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text("Movies")
                    .font(.largeTitle)
                Spacer()
                Button("Filter") {
                    activeSheet = .showFilter
                }
            }
            MovieListView(movies: movies)
            
            Text("Actors")
                .font(.largeTitle)
            ActorListView(actors: actors)
        } //: End of VStack
        .padding()
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button("Add Actor") {
                    activeSheet = .addActor
                }
            }
            
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    activeSheet = .addMovie
                }
            }
        })
        .sheet(item: $activeSheet) { sheet in
            switch sheet {
            case .addMovie:
                NavigationStack {
                    AddMovieScreens()
                }
            case .addActor:
                Text("Add Actor")
                    .font(.title)
                    .presentationDetents([.fraction(0.25)])
                TextField("Actor Name", text: $actorName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Save") {
                    addActor()
                    self.activeSheet = nil
                }
            case .showFilter:
                NavigationStack {
                    FilterSelectionScreen(filterOption: $filterOption)
                }
            }
        }
    }
    
    private func addActor() {
        let actor = Actor(name: actorName)
        context.insert(actor)
        actorName = ""
    }
}

#Preview {
    MovieListScreen()
        .modelContainer(for: [Movie.self, Review.self, Actor.self])
}
