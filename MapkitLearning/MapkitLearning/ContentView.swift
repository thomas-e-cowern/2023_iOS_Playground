//
//  ContentView.swift
//  MapkitLearning
//
//  Created by Thomas Cowern on 12/24/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var searchText: String = ""
    
    var body: some View {
        Map(position: $cameraPosition) {
//            Marker("My Location", systemImage: "paperplane", coordinate: .userLocation)
//                .tint(.blue)
            
            Annotation("My Location", coordinate: .userLocation) {
                ZStack {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.blue.opacity(0.25))
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.blue)
                }
            }
        }
        .overlay(alignment: .top) {
            TextField("Search for a location...", text: $searchText)
                .font(.subheadline)
                .padding(12)
                .background(Color.white)
                .padding()
                .shadow(radius: 10)
        }
        .mapControls {
            MapCompass()
            MapPitchToggle()
            MapUserLocationButton()
        }
    }
}

#Preview {
    ContentView()
}
