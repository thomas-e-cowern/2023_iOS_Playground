//
//  MenuView.swift
//  MvvmTest
//
//  Created by Thomas Cowern on 11/28/23.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject var vm : ItemViewModel
    
    var body: some View {
        Menu("Options") {
            Button("Add Item") {
                vm.addItem()
            }
            
            Button("Remove First Item") {
                vm.removeFirst()
            }
            .disabled(vm.itemList.count > 0 ? false : true)
            
            Button("Remove Last Item") {
                vm.removeLast()
            }
            .disabled(vm.itemList.count > 0 ? false : true)
            
            Button("Clear List") {
                vm.clearList()
            }
            .disabled(vm.itemList.count > 0 ? false : true)
            
            Button("Shuffle List") {
                vm.shuffle()
            }
            .disabled(vm.itemList.count > 1 ? false : true)
        }
    }
}

#Preview {
    MenuView(vm: ItemViewModel.init())
}
