//
//  ContentView.swift
//  SwiftUIMap
//
//  Created by Thomas Cowern on 8/22/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var restrooms: [Restroom] = []
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 26.7268,
            longitude: -80.1161
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.2,
            longitudeDelta: 0.2
        )
    )
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region, annotationItems: restrooms) { restroom in
                MapAnnotation(coordinate: restroom.coordinates) {
                    NavigationLink {
                        RestroomDetailView(restroom: restroom)
                    } label: {
                        Image(systemName: "mappin.circle.fill")
                    }

                }
            }
            .task {
                await loadRestrooms()
        }
        }
    }
    
    private func loadRestrooms() async {
        
        do {
            restrooms = try await WebService.shared.fetchRestrooms(at: Constants.Urls.restrooms)
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
