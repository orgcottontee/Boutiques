//
//  NetworkError.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case badRequest
    case notFound
    case invalidRequest
    case noInternetConnection
    case internalServerError
    case badGateway
    case serviceUnavailable
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "The request failed, please try again later."
        case .notFound:
            return "We're unable to load the details right now, please try again later."
        case .invalidRequest:
            return "The request could not be found, please try again later."
        case .noInternetConnection:
            return "Unable to load - please check your internet connection."
        case .internalServerError:
            return "Our servers encountered an unexpected error, please try again later."
        case .badGateway:
            return "Our servers are currently down, please try again later."
        case .serviceUnavailable:
            return "Our server is temporarily unavailable, please try again later."
        }
    }
}
