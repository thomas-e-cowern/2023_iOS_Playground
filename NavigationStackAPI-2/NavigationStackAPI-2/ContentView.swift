//
//  ContentView.swift
//  NavigationStackAPI-2
//
//  Created by Thomas Cowern on 3/22/23.
//

import SwiftUI

struct Customer: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

struct Settings: View {
    
    @EnvironmentObject private var navigationState: NavigationState
    
    var body: some View {
        Button("Home") {
            navigationState.routes.append(.home)
        }
    }
    
}

struct ContentView: View {
    
    @State private var numbers: [Int] = [2, 3]
    
    @EnvironmentObject private var navigationState: NavigationState
    
    var body: some View {

            VStack (spacing: 10) {
                Button("Home") {
                    navigationState.routes.append(.home)
                }
                
                Button("Details") {
                    navigationState.routes.append(.details(Customer(name: "John")))
                }
                
                Button("Settings") {
                    navigationState.routes.append(.settings)
                }
            }

        
        
        
        
//        NavigationStack(path: $numbers) {
//            VStack (spacing: 20) {
//                Button("Navigate") {
//                    numbers.append(1)
//                }
//
//                Button("Random Number") {
//                    let randomInt = Int.random(in: 100...200)
//                    numbers.append(randomInt)
//                }
//            }
//            .navigationDestination(for: Int.self) { value in
//                Text("\(value)")
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environmentObject(NavigationState())
                .navigationDestination(for: Route.self) { route in
                    switch route {
                        case .home:
                            Text("Home")
                        case .details(let customer):
                            Text(customer.name)
                        case.settings:
                            Text("Settings")
                    }
            }
        }
    }
}
