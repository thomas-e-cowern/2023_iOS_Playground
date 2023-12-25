//
//  LocationsDetailView.swift
//  MapkitLearning
//
//  Created by Thomas Cowern on 12/24/23.
//

import SwiftUI
import MapKit

struct LocationsDetailView: View {
    
    // MARK: - Properties
    @Binding var mapSelection: MKMapItem?
    @Binding var show: Bool
    @Binding var getDirections: Bool
    @State private var lookAroundScene: MKLookAroundScene?
    
    // MARK: - Body
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
            
            if let scene = lookAroundScene {
                LookAroundPreview(initialScene: scene)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
            } else {
                ContentUnavailableView("No preview available", systemImage: "eye.slash")
            }
            
            HStack(spacing: 24) {
                Button {
                    if let mapSelection {
                        mapSelection.openInMaps()
                    }
                } label: {
                    Text("Open in maps")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 170, height: 48)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                Button {
                    getDirections = false
                    show = false
                } label: {
                    Text("Get Directions")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 170, height: 48)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
        .onAppear {
            fetchLookAroundPreview()
        }
        .onChange(of: mapSelection) { oldValue, newValue in
            fetchLookAroundPreview()
        }
    }
    
    // MARK: - Methods and functionss
    func fetchLookAroundPreview() {
        if let mapSelection {
            lookAroundScene = nil
            Task {
                let request = MKLookAroundSceneRequest(mapItem: mapSelection)
                lookAroundScene = try? await request.scene
            }
        }
    }
}


// MARK: - Preview
#Preview {
    LocationsDetailView(mapSelection: .constant(nil), show: .constant(false), getDirections: .constant(false))
}
