//
//  ContentView.swift
//  SplashScreen
//
//  Created by Thomas Cowern on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
                    .animation(.easeOut(duration: 1.5), value: showSplash)
                
            } else {
                Text("You made it!")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3 ){
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
