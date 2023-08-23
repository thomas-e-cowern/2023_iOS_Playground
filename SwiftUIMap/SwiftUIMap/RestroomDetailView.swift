//
//  RestroomDetailView.swift
//  SwiftUIMap
//
//  Created by Thomas Cowern on 8/23/23.
//

import SwiftUI

struct RestroomDetailView: View {
    
    var restroom: Restroom
    
    var body: some View {
        VStack {
            Text(restroom.name)
            Text(restroom.street)
        }
    }
}

struct RestroomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestroomDetailView(restroom: Restroom(id: 1, name: "Bob's Burgers", city: "West Palm Beach", street: "123 Main Street", state: "FL", directions: "Go here", latitude: 123.12345, longitude: 123.12345))
    }
}
