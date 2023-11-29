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
            
            Menu("Options") {
                Button("Add Item") {
                    vm.addItem()
                }
                Button("Remove First Item") {
                    vm.removeFirst()
                }
                Button("Remove Last Item") {
                    vm.removeLast()
                }
                Button("Clear List") {
                    vm.clearList()
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
