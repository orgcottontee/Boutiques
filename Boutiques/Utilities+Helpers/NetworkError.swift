//
//  NetworkError.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation

enum NetworkError: Error {
    
    case unexpected(code: Int)
    case noInternetConnection
    case invalidAccessToken
    case invalidURL(_ url: String)
    case invalidRequest
    case unableToDecode
    
    
    var errorMessage: String {
        switch self {
        case .unexpected(let code):
            return "Unexpected error \(code)"
        case .noInternetConnection:
            return "No internet connection"
        case .invalidAccessToken:
            return "Invalid access token"
        case .invalidURL(_):
            return "Invalid URL"
        case .invalidRequest:
            return "Failed request"
        case .unableToDecode:
            return "Decode error"
            
            
        }
        //    case badRequest = "The request failed, please try again later."
        //    case unauthorized = "We're having trouble accessing our server, please try again later."
        //    case notFound = "We're unable to load the details right now, please try again later."
        //    case invalidRequest = "The request could not be found, please try again later."
        //    case noInternetConnection = "Unable to load - please check your internet connection."
        //    case internalServerError = "Our servers encountered an unexpected error, please try again later."
        //    case badGateway = "Our servers are currently down, please try again later."
        //    case serviceUnavailable = "Our server is temporarily unavailable, please try again later."
    }
}
