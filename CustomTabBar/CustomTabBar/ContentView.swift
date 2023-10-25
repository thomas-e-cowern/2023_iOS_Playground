//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    
    let tabItems = [
        TabBar(icon: "square.stack"),
        TabBar(icon: "magnifyingglass"),
        TabBar(icon: "house"),
        TabBar(icon: "star"),
        TabBar(icon: "person")
    ]
    
    var body: some View {
        HStack {
            ForEach(tabItems) { item in
                Image(systemName: item.icon)
            }
        }
    }
}

#Preview {
    ContentView()
}
