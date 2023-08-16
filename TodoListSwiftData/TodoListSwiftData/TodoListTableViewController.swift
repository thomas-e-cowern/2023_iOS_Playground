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
            
            let addTodoItemVC = AddTodoItemController()
            addTodoItemVC.delegate = self
            
            self?.present(addTodoItemVC, animated: true)
            
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

extension TodoListTableViewController: AddTodoItemControllerDelegate {
    func addTodoItemControllerDidSave(controller: UIViewController, todoItem: ToDoItem) {
        // save the item
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.containter.mainContext
        context.insert(todoItem)
        
        controller.dismiss(animated: true)
    }
}


// NEW
#Preview {
    UINavigationController(rootViewController: TodoListTableViewController())
}



