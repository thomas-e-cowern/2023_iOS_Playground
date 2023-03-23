//
//  ContentView.swift
//  NavigationSplitView
//
//  Created by Thomas Cowern on 3/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Text("Sidebar")
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
