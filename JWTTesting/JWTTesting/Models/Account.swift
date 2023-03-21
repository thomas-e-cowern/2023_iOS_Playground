//
//  Account.swift
//  JWTTesting
//
//  Created by Thomas Cowern on 3/17/23.
//

import Foundation

struct Account: Decodable {
    let name: String
    let type: String
    let balance: Double
}
