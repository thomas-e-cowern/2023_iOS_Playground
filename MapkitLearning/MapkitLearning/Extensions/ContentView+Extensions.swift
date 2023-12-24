//
//  ContentView+Extensions.swift
//  MapkitLearning
//
//  Created by Thomas Cowern on 12/24/23.
//

import Foundation
import MapKit

extension ContentView {
    func searchPlaces(searchText: String) async -> [MKMapItem] {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        let results = try? await MKLocalSearch(request: request).start()
        return results?.mapItems ?? []
    }
}
