//
//  ContentView.swift
//  CustomToggleStyle
//
//  Created by Thomas Cowern on 10/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAdvanced = false
    
    var body: some View {
        VStack {
            Toggle("Show Advanced Options", isOn: $showAdvanced)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
