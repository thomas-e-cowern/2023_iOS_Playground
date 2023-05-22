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
                    let headlinesURL = URL(string: "https://hws.dev/headlines.json")!
                    let messagesURL = URL(string: "https://hws.dev/messages.json")!

                    let (headlineData, _) = try await URLSession.shared.data(from: headlinesURL)
                    let (messageData, _) = try await URLSession.shared.data(from: messagesURL)

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
