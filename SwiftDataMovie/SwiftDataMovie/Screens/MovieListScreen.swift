//
//  MovieListScreen.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    
    @Environment(\.modelContext) private var context
    
//    @Query(sort: \.title, order: .reverse, animation: .default) private var movies: [Movie]
    @Query(sort: \.name, order: .forward) private var actors: [Actor]
    @Query(filter: #Predicate { $0.title.contains("Iron man")}, animation: .bouncy) private var movies: [Movie]
    
    @State private var isAddMoviePresented: Bool = false
    @State private var isAddActorPresented: Bool = false
    @State private var actorName: String = ""
    
    var body: some View {

        VStack(alignment: .leading) {
            Text("Movies")
                .font(.largeTitle)
            MovieListView(movies: movies)
            
            Text("Actors")
                .font(.largeTitle)
            ActorListView(actors: actors)
            
        } //: End of VStack
        .padding()
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button("Add Actor") {
                    isAddActorPresented = true
                }
            }
            
            
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
        .sheet(isPresented: $isAddActorPresented, content: {
            Text("Add Actor")
                .font(.title)
                .presentationDetents([.fraction(0.25)])
            TextField("Actor Name", text: $actorName)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button("Save") {
                isAddActorPresented = false
                addActor()
            }
        })
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
