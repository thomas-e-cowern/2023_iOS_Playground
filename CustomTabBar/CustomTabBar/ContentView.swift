//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
        VStack {
            
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                Text("Tab Content 1")
                    .tag(1)
                Text("Tab Content 2")
                    .tag(2)
                Text("Tab Content 3")
                    .tag(3)
                Text("Tab Content 4")
                    .tag(4)
                Text("Tab Content 5")
                    .tag(5)
                
            }
            .overlay(alignment: .bottom) {
                // Custom tab view
            }
            
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
