//
//  ContentView.swift
//  LearnMapsApp
//
//  Created by Thomas Cowern on 8/25/23.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 26.726880, longitude: -80.116130), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    let annotations = [
        Place(name: "1909", coordinate: CLLocationCoordinate2D(latitude: 26.712600, longitude: -80.052540)),
        Place(name: "Duffy's", coordinate: CLLocationCoordinate2D(latitude: 26.713310, longitude: -80.100750)),
        Place(name: "E.R. Bradley's", coordinate: CLLocationCoordinate2D(latitude: 26.712450, longitude: -80.049700))
    ]
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: annotations) {
//                MapPin(coordinate: $0.coordinate)
                MapMarker(coordinate: $0.coordinate)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
