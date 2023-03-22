//
//  ContentView.swift
//  NavigationStackAPI
//
//  Created by Thomas Cowern on 3/22/23.
//

import SwiftUI

struct DetailView: View {
    
    let value: Int
    
    var body: some View {
        Text("Value: \(value)")
    }
}

struct CustomerView: View {
    
    let name: String
    
    var body: some View {
        Text("Name: \(name)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack (spacing: 20){
                NavigationLink("DetailView", value: 99)
                    
                NavigationLink("CustomerView", value: "John Doe")
            }
            .navigationDestination(for: Int.self) { value in
                DetailView(value: value)
            }
            
            .navigationDestination(for: String.self) { value in
                CustomerView(name: value)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
