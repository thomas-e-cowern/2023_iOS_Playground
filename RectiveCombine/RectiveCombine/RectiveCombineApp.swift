//
//  RectiveCombineApp.swift
//  RectiveCombine
//
//  Created by Thomas Cowern on 12/3/23.
//

import SwiftUI
import Combine

@main
struct RectiveCombineApp: App {
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { _ in
                let currentOrientation = UIDevice.current.orientation
                print(currentOrientation)
            }.store(in: &cancellables)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
