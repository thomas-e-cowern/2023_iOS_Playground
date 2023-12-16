//
//  PreferenceKeyView.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 12/16/23.
//

import SwiftUI

struct PreferenceKeyView: View {
    
    @State private var text: String = "Hello World!"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryView(text: text)
            }
            .navigationTitle("Title")
        }
    }
}

struct SecondaryView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
    }
}

#Preview {
    PreferenceKeyView()
}
