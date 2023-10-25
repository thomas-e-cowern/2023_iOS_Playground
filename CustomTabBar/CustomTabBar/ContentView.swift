//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: TabIcon = .Home
    @State var offset = 2 * 70.0
    
    let tabItems = [
        TabBar(icon: "square.stack", tab: .Card, index: 0),
        TabBar(icon: "magnifyingglass", tab: .Favorite, index: 1),
        TabBar(icon: "house", tab: .Home, index: 2),
        TabBar(icon: "star", tab: .Purchases, index: 3),
        TabBar(icon: "person", tab: .Notification, index: 4)
    ]
    
    var body: some View {
        HStack {
            ForEach(tabItems) { item in
                Spacer()
                Image(systemName: item.icon)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedTab = item.tab
                            offset = CGFloat(item.index) * 70.0
                            print(item.tab)
                        }
                    }
                    .foregroundStyle(.white)
                Spacer()
            }
            .frame(width: 23.3)
        }
        .frame(height: 70)
        .background(.blue, in: RoundedRectangle(cornerRadius: 10))
        .overlay(alignment: .bottomLeading) {
            Circle().frame(width: 10, height: 10).foregroundStyle(.white)
                .offset(x: 30, y: -6)
                .offset(x: offset)
        }
    }
}

#Preview {
    ContentView()
}
