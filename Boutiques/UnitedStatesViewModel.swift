//
//  UnitedStatesViewModel.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation
import Observation

@Observable
final class UnitedStatesViewModel {
        
    private(set) var boutiques: [UnitedStatesResponse] = []
    private let sortField: String = "Name"
    private let sortDirection: String = "asc"
    
    @MainActor
    func loadBoutiques() async throws {
        do {
            boutiques = try await NetworkManager.shared.fetchUSBoutiques(sortField: sortField, sortDirection: sortDirection)
        } catch {
            print(error.localizedDescription)
            throw NetworkError.badGateway
        }
    }
}
