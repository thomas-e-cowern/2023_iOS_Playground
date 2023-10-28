//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    
//    Custom tab bar 2
//    @State private var tabSelection = 1
    
//    Custom tab bar 3
    @State private var selectedTab: Tab3 = .house
    
    var body: some View {
        VStack {
            
            CustomTabBar3(selectedTab: $selectedTab)
            
//            TabView(selection: $tabSelection) {
//                HomeView()
//                    .tag(1)
//                SearchView()
//                    .tag(2)
//                FavoritesView()
//                    .tag(3)
//                Text("Tab Content 4")
//                    .tag(4)
//                Text("Tab Content 5")
//                    .tag(5)
//                
//            }
//            .overlay(alignment: .bottom) {
//                // Custom tab view
//                CustomTabView2(tabSelection: $tabSelection)
//            }
            
//            Text("Content View")
//            
//            Spacer()
//            
//            CustomTabBar(selectedTab: $selectedTab)
            
            
// old tab bar
//            Spacer()
//            HStack {
//                ForEach(tabItems) { item in
//                    Spacer()
//                    Image(systemName: item.icon)
//                        .frame(width: 50)
//                        .onTapGesture {
//                            withAnimation(.spring()) {
//                                //                                selectedTab = item.tab
//                                offset = CGFloat(item.index) * 70.0
//                                print(item.tab)
//                            }
//                        }
//                        .foregroundStyle(.white)
//                    Spacer()
//                }
//            }
//            .padding()
//            .frame(height: 70)
//            .background(.blue, in: RoundedRectangle(cornerRadius: 10))
//            .overlay(alignment: .bottomLeading) {
//                Circle().frame(width: 10, height: 10).foregroundStyle(.white)
//                    .offset(x: 50, y: -6)
//                    .offset(x: offset)
//            }
        }
    }
}

#Preview {
    ContentView()
}
