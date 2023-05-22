//
//  NetworkingSandboxApp.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 5/22/23.
//

import SwiftUI

@main
struct NetworkingSandboxApp: App {
    
    @State private var networkManager = NetworkManager(environment: .testing)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.networkManager, networkManager)
        }
    }
}
