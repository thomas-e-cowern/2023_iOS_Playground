//
//  AddMovieScreens.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI
import SwiftData

struct AddMovieScreens: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var year: Int?
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpaces && year != nil
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
                
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    
                    guard let year = year else {
                        return year = Calendar.current.component(.year, from: Date())
                    }
                    
                    let movie = Movie(title: title, year: year)
                    context.insert(movie)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                .disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddMovieScreens()
            .modelContainer(for: [Movie.self])
    }
}
