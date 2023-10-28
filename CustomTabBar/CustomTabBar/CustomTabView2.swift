//
//  CustomTabView2.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/28/23.
//

import SwiftUI

struct CustomTabView2: View {
    
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title: String)] = [
        ("house", "Home"),
        ("magnifyingglass", "Search"),
        ("heart", "Favorites"),
        ("person", "Profile"),
        ("gear", "Settings")
    ]
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundStyle(Color.primary)
                .shadow(radius: 2)
            
            HStack {
                ForEach(0..<5) { index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        VStack (spacing: 8) {
                            Spacer()
                            
                            Image(systemName: tabBarItems[index].image)
                            
                            Text(tabBarItems[index].title)
                                .font(.caption)
                            
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundStyle(Color.blue)
                                    .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespace)
                                    .offset(y: 3)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundStyle(Color.clear)
                                    .offset(y: 3)
                            }
                        }
                        .foregroundStyle(index + 1 == tabSelection ? Color.blue : Color.gray)
                    }
                }
            }
            .frame(height: 80)
        }
        .clipShape(Capsule())
        .padding(.horizontal)
    }
}

#Preview {
    CustomTabView2(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
}
