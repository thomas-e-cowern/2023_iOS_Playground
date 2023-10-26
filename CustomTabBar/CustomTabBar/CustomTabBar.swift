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
                VStack {
                    Image(systemName: "bubble.left")
                    Text("Chats")
                }
            }

        }
        .frame(height: 82)
    }
}

#Preview {
    CustomTabBar()
}
