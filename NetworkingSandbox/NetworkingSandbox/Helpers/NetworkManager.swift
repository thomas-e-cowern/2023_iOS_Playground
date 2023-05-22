//
//  NetworkManager.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 5/22/23.
//

import Foundation

struct NetworkManager {
    var environment: AppEnvironment
    
    func fetch<T>(_ resource: Endpoint<T>, with data: Data? = nil) async throws -> T {
        guard let url = URL(string: resource.path, relativeTo: environment.baseURL) else {
            throw URLError(.unsupportedURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = resource.method.rawValue
        request.httpBody = data
        request.allHTTPHeaderFields = resource.headers
        
        var (data, _) = try await environment.session.data(for: request)
       
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
