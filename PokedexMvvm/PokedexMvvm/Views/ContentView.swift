//
//  ContentView.swift
//  PokedexMvvm
//
//  Created by Thomas Cowern on 11/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            
        }
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
