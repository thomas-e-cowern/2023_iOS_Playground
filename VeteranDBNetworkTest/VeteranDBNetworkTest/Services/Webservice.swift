//
//  Webservice.swift
//  VeteranDBNetworkTest
//
//  Created by Thomas Cowern on 3/26/23.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}


// Login Models
struct LoginResponse: Codable {
    let status: String
    let access_token: String
}

struct LoginData: Codable {
    let data: LoginResponse
}

class Webservice {
        
//    func getAllAccounts(token: String, completion: @escaping (Result<[Account], NetworkError>) -> Void) {
//
//        guard let url = URL(string: "https://backend-with-auth.glitch.me/accounts") else {
//            completion(.failure(.invalidURL))
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//            guard let data = data, error == nil else {
//                completion(.failure(.noData))
//                return
//            }
//
//            guard let accounts = try? JSONDecoder().decode([Account].self, from: data) else {
//                print("inside accounts")
//                completion(.failure(.decodingError))
//                return
//            }
//
//            completion(.success(accounts))
//
//
//
//        }.resume()
//
//
//    }
    
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
//        guard let url = URL(string: "https://api.veterandb.com/v1/account/login") else {
//            completion(.failure(.custom(errorMessage: "URL is not correct")))
//            return
//        }
//
//        let body = LoginRequestBody(username: username, password: password)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("Bearer 34388ecc8cc4e82da33a288cb103b758612ab0a338b135e2d449c200d0e41b2390c86970f991f03ae9505adee887be38a0a081898282dfc6a6bcba6dbe1f8de868ad25d0849fe0968ba6a9e656a82b5736ee54013ee3114aa097825cecac55155f3e537b60c9441f4304c15828c634261c1b1931778b719d4474d97694515153", forHTTPHeaderField: "Authorization")
//        request.addValue("veterandb-access=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Nzk4NTA2MTQsImV4cCI6MTY4MjQ0MjYxNH0.mAaupPbTSTLoRIohC8ZYu-WFJF1n2MG8n2gdDvkFA98", forHTTPHeaderField: "Cookie")
//        request.httpBody = try? JSONEncoder().encode(body)
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//            guard let data = data, error == nil else {
//                completion(.failure(.custom(errorMessage: "No data")))
//                return
//            }
//
//            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
//                completion(.failure(.invalidCredentials))
//                return
//            }
//
//            guard let token = loginResponse.token else {
//                completion(.failure(.invalidCredentials))
//                return
//            }
//
//            completion(.success(token))
//            print("Data: \(loginResponse)")
//
//        }.resume()
        let parameters = "{\n\t\"email\": \"tcowern@yahoo.com\",\n\t\"password\": \"TiTvp!@46\"\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.veterandb.com/v1/account/login")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer 34388ecc8cc4e82da33a288cb103b758612ab0a338b135e2d449c200d0e41b2390c86970f991f03ae9505adee887be38a0a081898282dfc6a6bcba6dbe1f8de868ad25d0849fe0968ba6a9e656a82b5736ee54013ee3114aa097825cecac55155f3e537b60c9441f4304c15828c634261c1b1931778b719d4474d97694515153", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("veterandb-access=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Nzk4NTA2MTQsImV4cCI6MTY4MjQ0MjYxNH0.mAaupPbTSTLoRIohC8ZYu-WFJF1n2MG8n2gdDvkFA98", forHTTPHeaderField: "Cookie")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }            
            let login = try! JSONDecoder().decode(LoginData.self, from: data)
            
            print("Data: \(login.data.status)")
            print("Data: \(login.data.access_token)")
            
            completion(.success(login.data.access_token))
        }

        task.resume()
    }
}
