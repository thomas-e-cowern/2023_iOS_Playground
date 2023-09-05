//
//  ContentView.swift
//  GlobalError
//
//  Created by Thomas Cowern on 9/5/23.
//

import SwiftUI

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance:  String?
}

struct ContentView: View {
    
    @State private var errorWrapper: ErrorWrapper?
    
    private enum SampleError: Error {
        case operationFailed
    }
    
    var body: some View {
        VStack {
            Button("Throw Error") {
                do {
                    throw SampleError.operationFailed
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Please try again")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
