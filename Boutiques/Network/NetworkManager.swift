//
//  NetworkManager.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let decoder: JSONDecoder = JSONDecoder()
    
    private init() { }
    
    // MARK: - Fetch data for list screen
    
    func fetchBoutiqueAscOrder(sortField: String?, sortDirection: String?) async throws -> [BoutiqueResponse] {
        
        guard let accessToken = Bundle.main.infoDictionary?["ACCESS_TOKEN"] as? String else {
            throw NetworkError.invalidAccessToken
        }
       
        guard let baseURL = URL(string: AirtableAPI.UnitedStates.baseURL) else {
            throw NetworkError.invalidURL(AirtableAPI.UnitedStates.baseURL)
        }
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let sortFieldItem = URLQueryItem(name: "sort[0][field]", value: sortField)
        let sortDirectionItem = URLQueryItem(name: "sort[0][direction]", value: sortDirection)
        urlComponents.queryItems = [sortFieldItem, sortDirectionItem]
    
        var request = URLRequest(url: urlComponents.url!,
                                 cachePolicy: .reloadRevalidatingCacheData
        )
        
        request.setValue("\(AirtableAPI.value) \(accessToken)",
                         forHTTPHeaderField: AirtableAPI.header
        )
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }

        do {
            let decodedResponse = try decoder.decode(Boutique.self, from: data)
            return decodedResponse.records
        } catch(let error) {
            print("Unable to decode response \(error)")
            throw NetworkError.invalidRequest
        }
    }
    
    // MARK: - Fetch data for map screen
    
    func fetchBoutiqueForMap() async throws -> [BoutiqueResponse] {
        
        guard let accessToken = Bundle.main.infoDictionary?["ACCESS_TOKEN"] as? String else {
            throw NetworkError.invalidAccessToken
        }
       
        guard let baseURL = URL(string: AirtableAPI.UnitedStates.baseURL) else {
            throw NetworkError.invalidURL(AirtableAPI.UnitedStates.baseURL)
        }
        
        var request = URLRequest(url: baseURL,
                                 cachePolicy: .reloadRevalidatingCacheData
        )
        
        request.setValue("\(AirtableAPI.value) \(accessToken)",
                         forHTTPHeaderField: AirtableAPI.header
        )
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }

        do {
            let decodedResponse = try decoder.decode(Boutique.self, from: data)
            return decodedResponse.records
        } catch(let error) {
            print("Unable to decode response \(error)")
            throw NetworkError.invalidRequest
        }
    }
}
