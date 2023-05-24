//
//  NumberFormatter+Extensions.swift
//  CoffeeApp
//
//  Created by Thomas Cowern on 5/24/23.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
}
