//
//  GroceryAppApp.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/6/23.
//

import SwiftUI

@main
struct GroceryAppApp: App {
    
    @StateObject private var model = GroceryModel()
    
    var body: some Scene {
        WindowGroup {
            RegistrationScreen()
                .environmentObject(model)
        }
    }
}
