//
//  View1.swift
//  NavigationStackAPISpecificView
//
//  Created by Thomas Cowern on 3/22/23.
//

import SwiftUI

struct Customer: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

struct CustomerDetailView: View {
    
    let customer: Customer
    
    var body: some View {
        Text("CustomerDetailView")
    }
}

struct View2: View {
    
    @EnvironmentObject private var navigationState: NavigationState
    
    var body: some View {
        Button("View 3") {
            navigationState.routes.append(.view3)
        }.navigationTitle("View 2")
    }
}

struct View5: View {
    
    @EnvironmentObject private var navigationState: NavigationState
    
    var body: some View {
        
        Button("Pop to Root") {
            navigationState.popToRoot()
        }
        
        Button("View 3") {
            navigationState.popTo(.view3)
        }.navigationTitle("View 5")
    }
}

struct View4: View {
    
    @EnvironmentObject private var navigationState: NavigationState
    
    var body: some View {
        VStack {
            
            Button("Pop to Root") {
                navigationState.popToRoot()
            }
            
            Button("View 5") {
                navigationState.routes.append(.view5)
            }
        }.navigationTitle("View 4")
    }
}

struct View3: View {
    
    @EnvironmentObject private var navigationState: NavigationState
    
    var body: some View {
        Button("View 4") {
            navigationState.routes.append(.view4)
        }.navigationTitle("View 3")
    }
}

struct ContainerView1: View {
    
    @StateObject private var navigationState = NavigationState()
    
    var body: some View {
        NavigationStack(path: $navigationState.routes) {
            View1()
                .environmentObject(navigationState)
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
    }
}

struct View1: View {
    
    @EnvironmentObject private var navigationState: NavigationState
    
    var body: some View {
            VStack {
                Button("View 2") {
                    navigationState.routes.append(.view2)
                }
            }.navigationTitle("View 1")
    }
}

struct View1_Previews: PreviewProvider {
    
    static var previews: some View {
        ContainerView1()
    }
}
