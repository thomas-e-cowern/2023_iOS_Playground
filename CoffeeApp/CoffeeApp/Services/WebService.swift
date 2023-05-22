//
//  WebService.swift
//  CoffeeApp
//
//  Created by Thomas Cowern on 5/22/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
    case badUrl
}

class WebService {
    
    func getOrders() async throws -> [Order] {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let orders = try? JSONDecoder().decode([Order].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return orders
    }
    
}
