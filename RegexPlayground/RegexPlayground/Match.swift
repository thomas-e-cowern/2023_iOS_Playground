//
//  Match.swift
//  RegexPlayground
//
//  Created by Thomas Cowern on 3/28/23.
//

import Foundation

struct Match: Identifiable {
    var id = UUID()
    var text: String
    var position: String
    var groups: [Match]?
}
