//
//  Movie.swift
//  
//
//  Created by Thomas Cowern on 5/27/23.
//

import Foundation
import Vapor
import Fluent

final class Movie: Model, Content {
    
    static let schema: String = "movies"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    init() {}
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
