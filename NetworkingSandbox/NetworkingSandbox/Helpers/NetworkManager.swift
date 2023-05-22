//
//  NetworkManager.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 5/22/23.
//

import Foundation

struct NetworkManager {
    func fetch<T>(_ resource: Endpoint<T>, with data: Data? = nil) async throws -> T {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.method.rawValue
        request.httpBody = data
        request.allHTTPHeaderFields = resource.headers
        
        var (data, _) = try await URLSession.shared.data(for: request)
       
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
