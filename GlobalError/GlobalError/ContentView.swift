//
//  ContentView.swift
//  GlobalError
//
//  Created by Thomas Cowern on 9/5/23.
//

import SwiftUI

struct ShowErrorEnvironmentKey: EnvironmentKey {
    static var defaultValue: (Error, String) -> Void = { _, _ in }
}

extension EnvironmentValues {
    var showError: (Error, String) -> Void {
        get { self[ShowErrorEnvironmentKey.self]}
        set { self[ShowErrorEnvironmentKey.self] = newValue }
    }
}

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance:  String?
}

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        VStack {
            Text(errorWrapper.error.localizedDescription)
            Text(errorWrapper.guidance ?? "")
        }
    }
}

struct ContentView: View {
    
    @Environment(\.showError) private var showError
    
    private enum SampleError: Error {
        case operationFailed
    }
    
    var body: some View {
        VStack {
            Button("Throw Error") {
                do {
                    throw SampleError.operationFailed
                } catch {
                    showError(error, "Please try again")
                }
            }
        }
        .padding()
    }
}

struct ContentViewContainer: View {
    
    @State var errorWrapper: ErrorWrapper?
    
    var body: some View {
        ContentView()
            .environment(\.showError) { error, guidance in
                errorWrapper = ErrorWrapper(error: error, guidance: guidance)
            }
            .sheet(item: $errorWrapper) { error in
                ErrorView(errorWrapper: error)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewContainer()
    }
}
