//
//  String+Extensions.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpaces: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
