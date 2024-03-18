//
//  NetworkError.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation

enum NetworkError: String, Error {
    
    case badRequest = "The request failed, please try again later."
    case unauthorized = "We're having trouble accessing our server, please try again later."
    case notFound = "We're unable to load the details right now, please try again later."
    case invalidRequest = "The request could not be found, please try again later."
    case noInternetConnection = "Unable to load - please check your internet connection."
    case internalServerError = "Our servers encountered an unexpected error, please try again later."
    case badGateway = "Our servers are currently down, please try again later."
    case serviceUnavailable = "Our server is temporarily unavailable, please try again later."
}
