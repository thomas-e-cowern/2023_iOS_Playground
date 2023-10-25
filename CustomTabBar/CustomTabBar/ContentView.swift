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
                Button {
                    selectedTab = item.tab
                } label: {
                    Spacer()
                    Image(systemName: item.icon)
                        .foregroundColor(.white)
                    Spacer()
                }
                
            }
        }
        .frame(height: 70)
        .background(.blue, in: RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ContentView()
}
