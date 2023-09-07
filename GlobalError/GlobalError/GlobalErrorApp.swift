//
//  GlobalErrorApp.swift
//  GlobalError
//
//  Created by Thomas Cowern on 9/5/23.
//

import SwiftUI

@main
struct GlobalErrorApp: App {
    
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.showError) { error, guidance in
                    errorWrapper = ErrorWrapper(error: error, guidance: guidance)
                }
                .sheet(item: $errorWrapper) { error in
                    ErrorView(errorWrapper: error)
                }
        }
    }
}
