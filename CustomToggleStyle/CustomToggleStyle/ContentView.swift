//
//  ContentView.swift
//  CustomToggleStyle
//
//  Created by Thomas Cowern on 10/7/23.
//

import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .foregroundColor(configuration.isOn ? .green : .red)
            
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(configuration.isOn ? .accentColor : .secondary)
            }
        }
    }
    
    
}

struct ContentView: View {
    
    @State private var showAdvanced = false
    
    var body: some View {
        VStack {
            Toggle("Show Advanced Options", isOn: $showAdvanced)
                .toggleStyle(CheckToggleStyle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
