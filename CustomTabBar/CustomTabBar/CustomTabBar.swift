//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/26/23.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack {
         
            Button {
                // Action
            } label: {
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "bubble.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Chats")
                        .font(Fonts.tabBar)
                }
            }

        }
        .frame(height: 82)
    }
}

#Preview {
    CustomTabBar()
}
