//
//  ContentView.swift
//  SwiftUIMap
//
//  Created by Thomas Cowern on 8/22/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        Map(mapRect: <#Binding<MKMapRect>#>)
    }
    
    private func loadRestrooms() async {
        
        do {
           try await WebService.shared.fetchRestrooms(at: Constants.Urls.restrooms)
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
