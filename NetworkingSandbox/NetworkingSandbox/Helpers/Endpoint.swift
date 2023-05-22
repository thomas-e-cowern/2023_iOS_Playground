//
//  Endpoint.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 5/22/23.
//

import Foundation

struct Endpoint<T: Decodable> {
    var url: URL
    var type: T.Type
    var method = HTTPMethod.get
    var headers = [String: String]()
}

extension Endpoint where T == [News] {
    static let headlines = Endpoint(url: URL(string: "https://hws.dev/headlines.json")!, type: [News].self)
}

extension Endpoint where T == [Message] {
    static let messages = Endpoint(url: URL(string: "https://hws.dev/messages.json")!, type: [Message].self)
}

extension Endpoint where T == [String: String] {
    static let userTest = Endpoint(url: URL(string: "https://reqres.in/api/users")!, type: [String: String].self, method: .post, headers: ["Content-Type": "application/json"])
}
