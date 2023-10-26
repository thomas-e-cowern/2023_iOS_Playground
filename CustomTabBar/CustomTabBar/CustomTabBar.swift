//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/26/23.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack (alignment: .center) {
         
            Button {
                // Action
            } label: {
                GeometryReader { geo in
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "bubble.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("Chats")
                            .font(Fonts.tabBar)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
                
            }
            .tint(Color("icons-secondary"))
            
            Button {
                // New chat
            } label: {
                GeometryReader { geo in
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                        Text("New Chat")
                            .font(Fonts.tabBar)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
                
            }
            .tint(Color("icons-primary"))
            
            Button {
                // Action
            } label: {
                GeometryReader { geo in
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("Contacts")
                            .font(Fonts.tabBar)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .tint(Color("icons-secondary"))


        }
        .frame(height: 82)
    }
}

#Preview {
    CustomTabBar()
}
