//
//  ContentView.swift
//  DynamicPropertyWrapper
//
//  Created by Thomas Cowern on 10/7/23.
//

import SwiftUI

@propertyWrapper struct Document {
    @State private var value = ""
    private let url: URL
    
    var wrappedValue: String {
        get {
            value
        }
        
        nonmutating set {
            do {
                try newValue.write(to: url, atomically: true, encoding: .utf8)
                value = newValue
            } catch {
                print("Failed to write output")
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
