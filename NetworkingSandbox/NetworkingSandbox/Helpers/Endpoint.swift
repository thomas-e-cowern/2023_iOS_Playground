//
//  Endpoint.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 5/22/23.
//

import Foundation

struct Endpoint<T: Decodable> {
    var path: String
    var type: T.Type
    var method = HTTPMethod.get
    var headers = [String: String]()
    var keyPath: String?
}

extension Endpoint where T == [News] {
    static let headlines = Endpoint(path: "headlines.json", type: [News].self)
}

extension Endpoint where T == [Message] {
    static let messages = Endpoint(path: "messages.json", type: [Message].self)
}

extension Endpoint where T == String {
    static let city = Endpoint(path: "nested.json", type: String.self, keyPath: "response.user.address.city")
}

extension Endpoint where T == String {
    static let state = Endpoint(path: "nested.json", type: String.self, keyPath: "response.user.address.state")
}
//extension Endpoint where T == [String: String] {
//    static let userTest = Endpoint(url: URL(string: "https://reqres.in/api/users")!, type: [String: String].self, method: .post, headers: ["Content-Type": "application/json"])
//}
