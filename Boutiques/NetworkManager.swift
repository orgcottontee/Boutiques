//
//  NetworkManager.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    // MARK: - Fetch US data
    
    func fetchUSBoutiques() async throws -> [UnitedStatesResponse] {
        
        guard let accessToken = Bundle.main.infoDictionary?["ACCESS_TOKEN"] as? String else {
            throw NetworkError.unauthorized
        }
       
        guard let baseURL = URL(string: CountryAPIs.UnitedStates.baseURL) else {
            throw NetworkError.notFound
        }
    
        var request = URLRequest(url: baseURL,
                                 cachePolicy: .reloadRevalidatingCacheData
        )
        
        request.setValue("\(AirtableAPI.value) \(accessToken)",
                         forHTTPHeaderField: AirtableAPI.header
        )
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badRequest
        }

        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(UnitedStatesData.self, from: data)
            return decodedResponse.records
        } catch {
            throw NetworkError.invalidRequest
        }
    }
}
