//
//  WebService.swift
//  SwiftUIMap
//
//  Created by Thomas Cowern on 8/23/23.
//

import Foundation

struct WebService {
    
    static let shared = WebService()
    
    private init () {
        
    }
    
    private enum WebServiceError: Error {
        case invalidResponse
        case decodingError(Error)
    }
    
    func fetchRestrooms(at url: URL) async throws -> [Restroom] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw WebServiceError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode([Restroom].self, from: data)
        } catch {
            throw WebServiceError.decodingError(error)
        }
    }
}
