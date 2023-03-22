//
//  NavigationStackAPI_2App.swift
//  NavigationStackAPI-2
//
//  Created by Thomas Cowern on 3/22/23.
//

import SwiftUI

enum Route: Hashable {
    case home
    case details(Customer)
    case settings
}

class NavigationState: ObservableObject {
    @Published var routes: [Route] = []
}

@main
struct NavigationStackAPI_2App: App {
    
    @StateObject private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                ContentView()
                    .environmentObject(navigationState)
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
}
