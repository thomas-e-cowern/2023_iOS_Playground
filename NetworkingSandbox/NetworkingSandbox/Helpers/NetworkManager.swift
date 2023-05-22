//
//  NetworkManager.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 5/22/23.
//

import Foundation

struct NetworkManager {
    func fetch(_ resource: Endpoint) async throws -> Data {
        var request = URLRequest(url: resource.url)
        var (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
