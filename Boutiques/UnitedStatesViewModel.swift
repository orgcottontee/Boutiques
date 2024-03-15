//
//  UnitedStatesViewModel.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation

@Observable
final class UnitedStatesViewModel {
    
    var boutiques: [UnitedStatesModel] = []
    
    func getBoutiques() async throws {
        do {
            boutiques = try await NetworkManager.shared.fetchUnitedStatesBoutiques()
        } catch {
            throw NetworkError.notFound
        }
    }
}
