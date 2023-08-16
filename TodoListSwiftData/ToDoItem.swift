//
//  ToDoItem.swift
//  TodoListSwiftData
//
//  Created by Thomas Cowern on 8/16/23.
//

import Foundation
import SwiftData

@Model
final class ToDoItem {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
