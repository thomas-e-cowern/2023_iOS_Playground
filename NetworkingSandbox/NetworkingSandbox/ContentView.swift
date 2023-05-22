//
//  ContentView.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 5/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var headlines = [News]()
    @State private var messages = [Message]()
    
    let networkManager = NetworkManager(environment: .production)
    
    var body: some View {
        VStack {
            List {
                Section("Headlines") {
                    ForEach(headlines) { headline in
                        VStack(alignment: .leading) {
                            Text(headline.title)
                                .font(.headline)
                            Text(headline.strap)
                        }
                    }
                }

                Section("Messages") {
                    ForEach(messages) { message in
                        VStack(alignment: .leading) {
                            Text(message.from)
                                .font(.headline)

                            Text(message.text)
                        }
                    }
                }
            }
            .task {
                do {
                    headlines = try await networkManager.fetch(.headlines)
                    messages = try await networkManager.fetch(.messages)
                    
//                    let user = ["name": "Bilbo Baggins", "job": "Ring Courier"]
//
//                    let response = try await networkManager.fetch(.userTest, with: JSONEncoder().encode(user))
//                    print(response)
                } catch {
                    print("Error handling is a smart move!")
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
