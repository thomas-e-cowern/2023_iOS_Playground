//
//  FilterSelectionScreen.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/21/23.
//

import SwiftUI
import SwiftData

enum FilterOption {
    case title(String)
    case reviewsCount(Int)
    case actorsCount(Int)
    case none
}

struct FilterSelectionScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var movieTitle: String = ""
    @State private var numberOfReviews: Int?
    @State private var numberOfActors: Int?
    @Binding var filterOption: FilterOption
    
    var body: some View {
        Form {
            Section("Filter by title") {
                TextField("Movie Title", text: $movieTitle)
                Button("Search") {
                    filterOption = .title(movieTitle)
                    dismiss()
                }
            }
            
            Section("Filter by number of reviews") {
                TextField("Number of reviews", value: $numberOfReviews, format: .number)
                Button("Search") {
                    filterOption = .reviewsCount(numberOfReviews ?? 0)
                    dismiss()
                }
            }
            
            Section("Filter by number of actors") {
                TextField("Number of actors", value: $numberOfActors, format: .number)
                Button("Search") {
                    filterOption = .actorsCount(numberOfActors ?? 0)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    FilterSelectionScreen(filterOption: .constant(.title("Iron man")))
}
