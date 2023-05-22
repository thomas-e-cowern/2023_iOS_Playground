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
    
    let networkManager = NetworkManager()
    
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
                    let headlineData = try await networkManager.fetch(.headlines)
                    let messageData = try await networkManager.fetch(.messages)

                    headlines = try JSONDecoder().decode([News].self, from: headlineData)
                    messages = try JSONDecoder().decode([Message].self, from: messageData)
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
