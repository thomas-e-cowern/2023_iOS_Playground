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
        List(Genre.allCases, id: \.self) { genre in
            Text(genre.rawValue)
        }
    }
}

struct ContentView: View {
    
    @State private var selectedGenre: Genre? = .action
    
    var body: some View {
        NavigationSplitView {
            GenreListview(selectedGenre: $selectedGenre)
        } detail: {
            Text("Detail")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
