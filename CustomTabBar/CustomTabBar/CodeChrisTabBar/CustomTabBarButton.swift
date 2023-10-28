//
//  CustomTabBarButton.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/27/23.
//

import SwiftUI

struct CustomTabBarButton: View {
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            
            if isActive {
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: geo.size.width/2, height: 4)
                .padding(.leading, geo.size.width/4)
            }
            
            VStack (alignment: .center, spacing: 4) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text(buttonText)
                    .font(Fonts.tabBar)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        
    }
}

#Preview {
    CustomTabBarButton(buttonText: "Contacts", imageName: "person", isActive: true)
        .frame(width: 60, height: 60)
}
