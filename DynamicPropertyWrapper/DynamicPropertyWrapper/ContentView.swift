//
//  ContentView.swift
//  DynamicPropertyWrapper
//
//  Created by Thomas Cowern on 10/7/23.
//

import SwiftUI

@propertyWrapper struct Document: DynamicProperty {
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
    
    var projectedValue: Binding<String> {
        Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }
    
    init(_ filename: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        url = paths[0].appendingPathComponent(filename)
        
        let initialText = (try? String(contentsOf: url)) ?? ""
        _value = State(wrappedValue: initialText)
    }
}

struct ContentView: View {
    
    @Document("test.txt") var document
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $document)
                
                Button("Change Document") {
                    document = String(Int.random(in: 1...1000))
                }
            }
            .navigationTitle("Simple Text")
        }
    }
}

#Preview {
    ContentView()
}
