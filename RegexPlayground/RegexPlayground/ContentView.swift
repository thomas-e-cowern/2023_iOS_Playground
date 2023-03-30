//
//  ContentView.swift
//  RegexPlayground
//
//  Created by Thomas Cowern on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var model = ViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter your regular expression", text: $model.pattern)
                .foregroundColor(model.isValid ? .primary : .red)
            TextEditor(text: $model.inputString)
                .padding(5)
                .border(.quaternary)
            
            TabView {
                List(model.matches, children: \.groups) { match in
                    Text("\(match.text) \(match.position)")
                        .font(.title3)
                }
                .tabItem {
                    Text("Matches")
                }
            }
            
            Text("Replacement")
            
            Text("Generated Code")
            
        }
        .onAppear(perform: model.update)
        .scrollContentBackground(.hidden)
        .font(.title3)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
