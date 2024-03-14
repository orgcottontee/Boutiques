//
//  NetworkManager.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchUnitedStatesBoutiques() async throws -> [UnitedStatesModel] {
        guard let accessToken = Bundle.main.infoDictionary?["ACCESS_TOKEN"] as? String else { throw NetworkError.unauthorized }

        guard let baseURL = URL(string: Constants.UnitedStatesAPI.baseURL) else { throw NetworkError.invalidRequest }
        
        var request = URLRequest(url: baseURL,
                                 cachePolicy: .reloadRevalidatingCacheData
                                 )
        
        request.setValue("\(Constants.AirtableAPI.value) \(accessToken)",
                         forHTTPHeaderField: "\(Constants.AirtableAPI.header)"
                         )
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(UnitedStatesResponse.self, from: data)
            return decodedResponse.records
        } catch {
            throw NetworkError.badRequest
        }
    }
}
