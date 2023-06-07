//
//  String+Extension.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/7/23.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
