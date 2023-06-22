//
//  ErrorView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/22/23.
//

import SwiftUI

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        VStack {
            Text("An error has occured in the application")
                .font(.headline)
                .padding(.bottom, 10)
            Text(errorWrapper.error.localizedDescription)
            Text(errorWrapper.guidance)
                .font(.caption)
        }
        .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    
    enum SampleError: Error {
        case operationFailed
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: ErrorWrapper(error: SampleError.operationFailed, guidance: "Operation has failed, try again later"))
    }
}
