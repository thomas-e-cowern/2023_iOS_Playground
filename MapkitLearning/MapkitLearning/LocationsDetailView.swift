//
//  LocationsDetailView.swift
//  MapkitLearning
//
//  Created by Thomas Cowern on 12/24/23.
//

import SwiftUI
import MapKit

struct LocationsDetailView: View {
    
    @Binding var mapSelection: MKMapItem?
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, content: {
                    Text(mapSelection?.placemark.name ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(mapSelection?.placemark.title ?? "")
                        .font(.footnote)
                        .foregroundStyle(Color.gray)
                        .lineLimit(2)
                        .padding(.trailing)
                })
                
                Spacer()
                
                Button(action: {
                    show.toggle()
                    mapSelection = nil
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color(.systemGray))
                })
            }
        }
    }
}

#Preview {
    LocationsDetailView(mapSelection: .constant(nil), show: .constant(false))
}
