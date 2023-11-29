//
//  ContentView.swift
//  MvvmTest
//
//  Created by Thomas Cowern on 11/28/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ItemViewModel()
    
    var body: some View {
        VStack {
            Toggle(isOn: $vm.isTurnedOn, label: {
                Text("Toggle Me")
            })
            .padding()
            .background(vm.isTurnedOn ? .green : .gray)
            
            HStack {
                Button("Increment") {
                    vm.increment()
                }
                Text("\(vm.counter)")
            }
            
            List(vm.itemList) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.description)
                }
            }
            .listStyle(.plain)
            .background(.thinMaterial)
            
            MenuView(vm: vm)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
