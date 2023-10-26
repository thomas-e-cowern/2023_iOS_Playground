//
//  CustomTabView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/26/23.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        
        let gradient = LinearGradient(colors: [.orange, .green],
                                      startPoint: .topLeading,
                                      endPoint: .bottomTrailing)
        
        TabView {
            ZStack {
                Color.green
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                VStack {
                    Text("You can use gradients as the TabView's background color.")
                        .padding()
                        .frame(maxHeight: .infinity)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(gradient)
                }
                .font(.title2)
            }
            .tabItem {
                Image(systemName: "star")
                Text("Tab 1")
            }
            
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "moon")
                    Text("Tab 2")
                }
            
            Text("Tab 3")
                .tabItem {
                    Image(systemName: "sun.max")
                    Text("Tab 3")
                }
        }
    }
}

#Preview {
    CustomTabView()
}
