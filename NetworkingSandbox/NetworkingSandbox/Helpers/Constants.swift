//
//  Constants.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 5/22/23.
//

import Foundation

struct Endpoint {
    var url: URL

    static let headlines = Endpoint(url: URL(string: "https://hws.dev/headlines.json")!)
    static let messages = Endpoint(url: URL(string: "https://hws.dev/messages.json")!)
}

