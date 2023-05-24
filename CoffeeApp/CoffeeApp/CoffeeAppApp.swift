//
//  CoffeeAppApp.swift
//  CoffeeApp
//
//  Created by Thomas Cowern on 5/22/23.
//

import SwiftUI

@main
struct CoffeeAppApp: App {
    
    @StateObject private var model: CoffeeModel
    
    init() {
        let webService = WebService()
        _model = StateObject(wrappedValue: CoffeeModel(webService: webService))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            ContentView().environmentObject(model)
        }
    }
}
