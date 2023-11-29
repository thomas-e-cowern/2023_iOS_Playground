//
//  ItemViewModel.swift
//  MvvmTest
//
//  Created by Thomas Cowern on 11/28/23.
//

import Foundation
import SwiftUI

class ItemViewModel: ObservableObject {
    @Published var isTurnedOn: Bool = false
    @Published var counter: Int = 0
    @Published var itemList: [Item] = []
    
    func increment() {
        counter += 1
    }
    
    func addItem() {
        let randomItems = ["Playstation", "Xbox", "Nintendo Wii", "Gameboy"]
        let item = randomItems.randomElement()!
        
        let newItem = Item(name: item, description: "Item \(itemList.count + 1)")
        
        withAnimation {
            itemList.insert(newItem, at: 0)
        }
    }
    
    func shuffle() {
        itemList.shuffle()
    }
    
    func removeFirst() {
        if itemList.count > 0 {
            itemList.removeFirst()
        }
    }
    
    func removeLast() {
        if itemList.count > 0 {
            itemList.removeLast()
        }
    }
    
    func clearList() {
        itemList.removeAll()
    }
}
