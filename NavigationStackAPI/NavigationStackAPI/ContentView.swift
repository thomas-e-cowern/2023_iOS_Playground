//
//  ContentView.swift
//  NavigationStackAPI
//
//  Created by Thomas Cowern on 3/22/23.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        Text("Details View")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailView()
            } label: {
                Image(systemName: "arrow.up")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
