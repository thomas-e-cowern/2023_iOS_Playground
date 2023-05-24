//
//  File.swift
//  
//
//  Created by Thomas Cowern on 5/23/23.
//

import Foundation
import Vapor

struct HotelQuery: Content {
    let sort: String
    let search: String?
}
