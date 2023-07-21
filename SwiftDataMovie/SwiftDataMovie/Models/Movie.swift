//
//  Movie.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var year: Int
    
    var reviewsCount: Int {
        reviews.count
    }
    
    var actorsCount: Int {
        actors.count
    }
    
    @Relationship(.cascade, inverse: \Review.movie)
    var reviews: [Review] = []
    
    @Relationship(.noAction, inverse: \Actor.movies)
    var actors: [Actor] = []
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}
