//
//  ViewController.swift
//  TodoListSwiftData
//
//  Created by Mohammad Azam on 6/28/23.
//

import UIKit
import SwiftUI
import SwiftData

class TodoListTableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addTodoItemAction = UIAction { [weak self] action in
            self?.present(AddTodoItemController(), animated: true)
        }
        
        let addTodoItemBarButton = UIBarButtonItem(systemItem: .add, primaryAction: addTodoItemAction)
        navigationItem.rightBarButtonItem = addTodoItemBarButton
        
        // register a cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoItemTableViewCell")
        
        // populate Items
        populateTodoItems()
    }
    
    private func populateTodoItems() {
       
    }
    
    
}


// NEW
#Preview {
    UINavigationController(rootViewController: TodoListTableViewController())
}



