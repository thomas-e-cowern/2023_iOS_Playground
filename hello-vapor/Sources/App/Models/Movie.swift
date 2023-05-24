//
//  Movie.swift
//  
//
//  Created by Thomas Cowern on 5/23/23.
//

import Foundation
import Vapor

struct Movie: Content {
    let title: String
    let year: Int
}
