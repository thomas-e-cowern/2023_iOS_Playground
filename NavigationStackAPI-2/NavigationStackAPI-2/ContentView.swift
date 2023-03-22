//
//  ContentView.swift
//  NavigationStackAPI-2
//
//  Created by Thomas Cowern on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers: [Int] = [2, 3]
    
    var body: some View {
        NavigationStack(path: $numbers) {
            VStack (spacing: 20) {
                Button("Navigate") {
                    numbers.append(1)
                }
                
                Button("Random Number") {
                    let randomInt = Int.random(in: 100...200)
                    numbers.append(randomInt)
                }
            }
            .navigationDestination(for: Int.self) { value in
                Text("\(value)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
