//
//  Message.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 5/22/23.
//

import Foundation

struct Message: Decodable, Identifiable {
    var id: Int
    var from: String
    var text: String
}
