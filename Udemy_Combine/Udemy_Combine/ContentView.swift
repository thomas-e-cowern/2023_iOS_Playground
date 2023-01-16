//
//  ContentView.swift
//  Udemy_Combine
//
//  Created by Thomas Cowern on 1/6/23.
//

import SwiftUI

struct ContentView: View {
    
    let vm = Notify()
    
    let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", ].publisher
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button("Notify") {
                vm.notify()
            }
        }
        .padding()
        .onAppear {
            vm.notify()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
