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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CustomTabView2(tabSelection: .constant(1))
}
