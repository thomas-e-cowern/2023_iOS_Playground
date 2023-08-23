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
    
    func fetchRestrooms(at url: URL) async throws -> [Restrooms] {
        
    }
    
}
