//
//  HTTPClient.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/7/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case serverError(String)
    case decodingError
    case invalidResponse
}

enum HTTPMethod {
    case get([URLQueryItem])
    case post(Data?)
    case delete
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        }
    }
}

struct Resource<T: Codable> {
    let url: URL
    var method: HTTPMethod = .get([])
    var modelType: T.Type
}

struct HTTPClient {
    
    private var defaultHeaders: [String: String] {
        var headers = ["Content-Type": "application/json"]
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "authToken") else {
            return headers
        }
        
        headers["Authorization"] = "Bearer \(token)"
        
        return headers
    }
    
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        
        print("Inside HTTP Client")
        
        var request = URLRequest(url: resource.url)
        
        print("URL: \(request)")
        
        switch resource.method {
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            guard let url = components?.url else {
                throw NetworkError.badRequest
            }
            
            request = URLRequest(url: url)
            
        case .post(let data):
            request.httpMethod = resource.method.name
            request.httpBody = data
            
        case .delete:
            request.httpMethod = resource.method.name
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        let session = URLSession(configuration: configuration)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
            case 409:
                throw NetworkError.serverError("Username is already taken")
            default:
                break
        }
        
        guard let result = try? JSONDecoder().decode(resource.modelType, from: data) else {
            print("Decoding error below")
            throw NetworkError.decodingError
        }
        
        return result
    }
    
}
