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
    
    private var todoItems: [ToDoItem] = []
   
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
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.containter.mainContext
        
        let fetchDescriptor: FetchDescriptor<ToDoItem> = FetchDescriptor()
        
        do {
            self.todoItems = try context.fetch(fetchDescriptor)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TodoItemTableViewCell", for: indexPath)
        let todoItem = self.todoItems[indexPath.row]
        
        var content = UIListContentConfiguration.cell()
        content.text = todoItem.title
        
        cell.contentConfiguration = content
        return cell
    }
    
}

extension TodoListTableViewController: AddTodoItemControllerDelegate {
    func addTodoItemControllerDidSave(controller: UIViewController, todoItem: ToDoItem) {
        // save the item
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.containter.mainContext
        context.insert(todoItem)
        
        controller.dismiss(animated: true)
        populateTodoItems()
    }
}


// NEW
#Preview {
    UINavigationController(rootViewController: TodoListTableViewController())
}



