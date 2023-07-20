//
//  Review.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import Foundation
import SwiftData

@Model
class Review {
    var subject: String
    var body: String
    var movie: Movie?
    
    init(subject: String, body: String, movie: Movie? = nil) {
        self.subject = subject
        self.body = body
        self.movie = movie
    }
}
