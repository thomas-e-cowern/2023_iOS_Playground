//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: TabIcon = .Home
    
    let tabItems = [
        TabBar(icon: "square.stack", tab: .Card),
        TabBar(icon: "magnifyingglass", tab: .Favorite),
        TabBar(icon: "house", tab: .Home),
        TabBar(icon: "star", tab: .Purchases),
        TabBar(icon: "person", tab: .Notification)
    ]
    
    var body: some View {
        HStack {
            ForEach(tabItems) { item in
                Spacer()
                Image(systemName: item.icon)
                    .foregroundStyle(.white)
                    .onTapGesture {
                        selectedTab = item.tab
                    }
                Spacer()
            }
            .frame(width: 23.3)
        }
        .frame(height: 70)
        .background(.blue, in: RoundedRectangle(cornerRadius: 10))
        .overlay(alignment: .bottomLeading) {
            Circle().frame(width: 10, height: 10).foregroundStyle(.white)
                .offset(x: 30, y: -6)
        }
    }
}

#Preview {
    ContentView()
}
