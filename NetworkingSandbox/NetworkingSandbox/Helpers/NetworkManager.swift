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
       
        if let keyPath = resource.keyPath {
            if let rootObject = try JSONSerialization.jsonObject(with: data) as? NSDictionary {
                if let nestedObject = rootObject.value(forKeyPath: keyPath) {
                    data = try JSONSerialization.data(withJSONObject: nestedObject, options: .fragmentsAllowed)
                }
            }
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    func fetch<T>(_ resource: Endpoint<T>, with data: Data? = nil, attempts: Int, retryDelay: Double = 1) async throws -> T {
        do {
            print("Attempting to fetch (Attempts remaining: \(attempts)")
            return try await fetch(resource, with: data)
        } catch {
            if attempts > 1 {
                try await Task.sleep(for: .milliseconds(Int(retryDelay * 1000)))
                return try await fetch(resource, with: data, attempts: attempts - 1, retryDelay: retryDelay)
            } else {
                throw error
            }
        }
    }
}
