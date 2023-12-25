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
    @State private var searchResults: [MKMapItem] = []
    @State private var mapSelection: MKMapItem?
    @State private var showDetails: Bool = false
    @State private var getDirections: Bool = false
    
    var body: some View {
        Map(position: $cameraPosition, selection: $mapSelection) {
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
            
            ForEach(searchResults, id: \.self) { item in
                let placemark = item.placemark
                Marker(placemark.name ?? "", coordinate: placemark.coordinate)
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
        .onSubmit(of: .text) {
            Task {
                searchResults = []
                searchResults = await searchPlaces(searchText: searchText)
            }
        }
        .onChange(of: mapSelection, { oldValue, newValue in
            showDetails = newValue != nil
        })
        .sheet(isPresented: $showDetails, content: {
            LocationsDetailView(mapSelection: $mapSelection, show: $showDetails, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(12)
        })
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
