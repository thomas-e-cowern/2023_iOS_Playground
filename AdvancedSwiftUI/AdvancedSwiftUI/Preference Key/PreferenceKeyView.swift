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
            .preference(key: CustomTitlePreferenceKey.self, value: "New Value")
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in
            self.text = value
        })
    }
}

extension View {
    func customTitle(text: String) -> some View {
        self
            .preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct SecondaryView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

#Preview {
    PreferenceKeyView()
}
