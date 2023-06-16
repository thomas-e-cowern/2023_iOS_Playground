//
//  UserDefaults+Extensions.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import Foundation

extension UserDefaults {
    var userId: UUID? {
        get {
            guard let userIdAsString = string(forKey: "userId") else {
                return nil
            }
            
            return UUID(uuidString: userIdAsString)
        }
        
        set {
            set(newValue?.uuidString, forKey: "userId")
        }
    }
}
