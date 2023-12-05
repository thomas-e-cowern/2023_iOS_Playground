//
//  ContentView.swift
//  RectiveCombine
//
//  Created by Thomas Cowern on 12/3/23.
//

import SwiftUI
import Combine



struct ContentView: View {
    
    @StateObject private var vm = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.value)")
                .font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
