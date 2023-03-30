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
            HStack {
                TextField("Enter your regular expression", text: $model.pattern)
                    .foregroundColor(model.isValid ? .primary : .red)
                
                Menu {
                    Button("Date (dd/mm/yyyy") {
                        model.pattern = #"(0?[1-9]|[12][0-9]|3[01])([-/.])(0?[1-9]|1[012])\2((?:19|20)\d\d)"#
                    }
                    
                    Button("Email Address") {
                        model.pattern = #"[:graph:]+@[:graph:]+\.[:graph:]{2,}"#
                    }
                    
                    Button("To Do List") {
                        model.pattern += #"(\d+)(?:\.|:)? *(.+)"#
                    }
                } label: {
                    Label("Presets", systemImage: "gear")
                }
                .menuIndicator(.hidden)
                .fixedSize()
            }
            
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
            
            VStack  {
                TextField("Replacement text", text: $model.replacement)
                    .padding()

                TextEditor(text: .constant(model.replacementOutput))
                    .padding(5)
                    .border(.quaternary)
                    .padding([.horizontal, .bottom])
            }
            .tabItem {
                Text("Replacement")
            }
            
            TextEditor(text: .constant(model.code))
                .padding(5)
                .border(.quaternary)
                .padding()
                .fontDesign(.monospaced)
                .tabItem {
                    Text("Code")
                }
            
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
