//
//  AddTodoItemController.swift
//  TodoListSwiftData
//
//  Created by Mohammad Azam on 6/28/23.
//

import Foundation
import UIKit
import SwiftData

class AddTodoItemController: UIViewController {
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter title"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .orange
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        self.view.backgroundColor = .lightGray
        
        let stackView = UIStackView(arrangedSubviews: [titleTextField, saveButton])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        saveButton.addAction(UIAction(handler: { [weak self] action in
            
           
            
        }), for: .touchUpInside)
        
        titleTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
}

#Preview {
    UINavigationController(rootViewController: AddTodoItemController())
}
