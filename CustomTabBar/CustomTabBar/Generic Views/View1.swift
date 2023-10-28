//
//  View1.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/26/23.
//

import SwiftUI

struct View1: View {
    var body: some View {
        TabView {
            VStack(spacing: 0) {
                ScrollView {
                    ForEach(0 ..< 15) { item in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange)
                            .frame(height: 44)
                            .padding()
                    }
                }
                
                Divider()
                    .background(Color.blue.opacity(0.2))
            }
            .font(.title2)
            .tabItem {
                Image(systemName: "star")
                Text("Tab 1")
            }
            
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "moon")
                    Text("Tab 2")
                }
        }
    }
}

#Preview {
    View1()
}
