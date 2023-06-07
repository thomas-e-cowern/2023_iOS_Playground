//
//  NetworkError+Extension.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/7/23.
//

import Foundation

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return NSLocalizedString("Unable to perform request", comment: "badRequestError")
        case .serverError(let errorMessage):
            print(errorMessage)
            return NSLocalizedString(errorMessage, comment: "serverError")
        case .decodingError:
            return NSLocalizedString("Unable to decode successfully", comment: "decodingError")
        case .invalidResponse:
            return NSLocalizedString("Invalid Response", comment: "invalidResponse")
        }
    }
}
