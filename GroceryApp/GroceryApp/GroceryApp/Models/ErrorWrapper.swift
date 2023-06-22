//
//  ErrorWrapper.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/22/23.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance: String
}
