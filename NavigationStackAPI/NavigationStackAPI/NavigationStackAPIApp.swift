//
//  NavigationStackAPIApp.swift
//  NavigationStackAPI
//
//  Created by Thomas Cowern on 3/22/23.
//

import SwiftUI

class NavigationState: ObservableObject {
    @Published var routes = NavigationPath()
}

@main
struct NavigationStackAPIApp: App {
    
    @StateObject private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                ContentView()
                    .environmentObject(navigationState)
                    .navigationDestination(for: Customer.self) { customer in
                        CustomerDetailView(customer: customer)
                }
            }
        }
    }
}
