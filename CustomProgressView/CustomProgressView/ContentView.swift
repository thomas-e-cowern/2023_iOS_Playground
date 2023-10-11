//
//  ContentView.swift
//  CustomProgressView
//
//  Created by Thomas Cowern on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress = 0.2
    
    var body: some View {
        ProgressView("Label", value: progress, total: 1.0)
            .frame(width: 200)
            .onTapGesture {
                if progress < 1.0 {
                    withAnimation {
                        progress += 0.2
                    }
                }
            }
    }
}

#Preview {
    ContentView()
}
