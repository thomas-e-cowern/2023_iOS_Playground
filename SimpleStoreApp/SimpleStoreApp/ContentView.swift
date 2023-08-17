//
//  ContentView.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ListCategoriesScreen()
                .tabItem {
                    Label("Categories", systemImage: "list.bullet")
                }
            ListProductsView()
                .tabItem {
                    Label("Products", systemImage: "figure.walk.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


