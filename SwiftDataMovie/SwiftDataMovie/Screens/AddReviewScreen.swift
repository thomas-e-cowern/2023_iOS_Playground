//
//  AddReviewScreen.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI
import SwiftData

struct AddReviewScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    let movie: Movie
    
    @State private var subject: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            TextField("Subject", text: $subject)
            TextField("Description", text: $description)
        }
        .navigationTitle("Add Review")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let review = Review(subject: subject, body: description, movie: movie)
                    context.insert(review)
                    
                    do {
                        try context.save()
                        movie.reviews?.append(review)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    dismiss()
                }
                .disabled(!isFormValid)
            }
        }
    }
    
    private var isFormValid: Bool {
        !subject.isEmptyOrWhiteSpaces && !description.isEmptyOrWhiteSpaces
    }
}

//#Preview {
//    AddReviewScreen()
//}
