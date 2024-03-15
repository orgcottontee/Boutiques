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
        print("Here is the access token \(accessToken)")
        print("-----------")

        guard let baseURL = URL(string: Constants.UnitedStatesAPI.baseURL) else { throw NetworkError.invalidRequest }
        print("Here is the baseURL \(baseURL)")
        print("-----------")
        
        var request = URLRequest(url: baseURL,
                                 cachePolicy: .reloadRevalidatingCacheData
                                 )
        
        request.setValue("\(Constants.AirtableAPI.value) \(accessToken)",
                         forHTTPHeaderField: Constants.AirtableAPI.header
                         )
        print("Here is the request \(request)")
        print("-----------")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print("Here is the response \(response)")
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(UnitedStatesResponse.self, from: data)
            return decodedResponse.records
        } catch {
            throw NetworkError.badRequest
        }
    }
}
