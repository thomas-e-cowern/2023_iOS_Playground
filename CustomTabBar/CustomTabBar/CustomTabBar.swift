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
                print(selectedTab)
            } label: {

                CustomTabBarButton(buttonText: "Chats", imageName: "bubble.left", isActive: selectedTab == .chats ? true : false)
                
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
                print(selectedTab)
            } label: {
                
                CustomTabBarButton(buttonText: "Contacts", imageName: "person", isActive: selectedTab == .contacts ? true : false)
                
            }
            .tint(Color("icons-secondary"))


        }
        .frame(height: 82)
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(Tabs.contacts))
}
