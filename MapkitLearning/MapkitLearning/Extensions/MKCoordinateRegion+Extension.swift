//
//  MKCoordinateRegion+Extension.swift
//  MapkitLearning
//
//  Created by Thomas Cowern on 12/24/23.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    static var userSettings: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}
