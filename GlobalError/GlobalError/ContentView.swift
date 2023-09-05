//
//  ContentView.swift
//  GlobalError
//
//  Created by Thomas Cowern on 9/5/23.
//

import SwiftUI



struct ContentView: View {
    
    private enum SampleError: Error {
        case operationFailed
    }
    
    var body: some View {
        VStack {
            Button("Throw Error") {
                do {
                    throw SampleError.operationFailed
                } catch {
                    print("error caught")
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
