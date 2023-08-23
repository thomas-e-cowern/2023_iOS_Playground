//
//  Restroom.swift
//  SwiftUIMap
//
//  Created by Thomas Cowern on 8/23/23.
//

import Foundation
import MapKit

struct Restroom: Identifiable, Codable {
    let id: Int
    let name: String
    let city: String
    let street: String
    let state: String
    let directions: String
    let latitude: Double
    let longitude: Double
    
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
