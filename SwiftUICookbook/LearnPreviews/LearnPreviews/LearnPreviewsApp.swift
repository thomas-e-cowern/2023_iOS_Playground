//
//  LearnPreviewsApp.swift
//  LearnPreviews
//
//  Created by Mohammad Azam on 9/8/21.
//

import SwiftUI

@main
struct LearnPreviewsApp: App {
    var body: some Scene {
        WindowGroup {
            let dish = SampleProvider.getDishSample()
            if let dish = dish {
                ContentView(dish: dish)
            }
        }
    }
}
