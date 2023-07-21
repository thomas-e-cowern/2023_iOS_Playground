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
}

struct FilterSelectionScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var movieTitle: String = ""
    
    var body: some View {
        Form {
            Section("Filter by title") {
                TextField("Movie Title", text: $movieTitle)
                Button("Search") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    FilterSelectionScreen()
}
