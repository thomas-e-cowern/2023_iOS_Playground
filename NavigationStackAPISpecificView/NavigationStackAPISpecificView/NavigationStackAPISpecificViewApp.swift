//
//  NavigationStackAPISpecificViewApp.swift
//  NavigationStackAPISpecificView
//
//  Created by Thomas Cowern on 3/22/23.
//


import SwiftUI

enum Route: Hashable {
    case view1
    case view2
    case view3
    case view4
    case view5
}

class NavigationState: ObservableObject {
    
    @Published var routes: [Route] = []
    
    func popTo(_ route: Route) {
        guard let index = routes.firstIndex(of: route) else { return }
        routes = Array(routes[0...index])
    }
    
    func popToRoot() {
        routes.removeLast(routes.count)
    }
}

@main
struct NavigationStackAPIApp: App {
        
    @StateObject private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                View1()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                            case .view1:
                                View1()
                            case .view2:
                                View2()
                            case .view3:
                                View3()
                            case .view4:
                                View4()
                            case .view5:
                                View5()
                        }
                    }
            }
            .environmentObject(navigationState)
        }
    }
}

