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
                Spacer()
                Image(systemName: item.icon)
                Spacer()
            }
        }
        .frame(height: 70)
        .background(.blue, in: RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ContentView()
}
