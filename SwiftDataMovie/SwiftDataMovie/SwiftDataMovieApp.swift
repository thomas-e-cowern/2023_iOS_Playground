//
//  SwiftDataMovieApp.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI

@main
struct SwiftDataMovieApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AddMovieScreens()
            }
        }
        .modelContainer(for: [Movie.self])
    }
}
