//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/26/23.
//

import SwiftUI

enum Tabs: Int {
    case chats = 0
    case contacts = 1
    
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack (alignment: .center) {
         
            Button {
                selectedTab = .chats
            } label: {
                GeometryReader { geo in
                    
                    if selectedTab == .chats {
                        Rectangle()
                            .foregroundColor(Color.blue)
                            .frame(width: geo.size.width/2, height: 4)
                        .padding(.leading, geo.size.width/4)
                    } 
                    
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
                selectedTab = .contacts
            } label: {
                GeometryReader { geo in
                    
                    if selectedTab == .contacts {
                        Rectangle()
                            .foregroundColor(Color.blue)
                            .frame(width: geo.size.width/2, height: 4)
                        .padding(.leading, geo.size.width/4)
                    }
                    
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
    CustomTabBar(selectedTab: .constant(Tabs.contacts))
}
