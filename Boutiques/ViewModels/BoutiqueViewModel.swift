//
//  UnitedStatesViewModel.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation
import Observation

@Observable
final class BoutiqueViewModel {
    
    // MARK: - Properties
    
    private(set) var boutiques: [BoutiqueResponse] = []
    
    // MARK: Filter properties
    
    var filterStatus: USState = USState.allStates
    var filterResults: [BoutiqueResponse] {
        filterStatus == .allStates ? searchResults : boutiques.filter { $0.fields.state == filterStatus.rawValue }
    }
    
    // MARK: Search properties
    
    var searchText: String = ""
    private var searchResults: [BoutiqueResponse] {
        searchText.isEmpty ? boutiques : boutiques.filter { $0.fields.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    // MARK: - Actions
    @MainActor
    func loadBoutiques() async throws {
        
        do {
            boutiques = try await NetworkManager.shared.fetchBoutiqueAscOrder(sortField: AirtableAPI.sortByName, sortDirection: AirtableAPI.sortByAsc)
        } catch {
            print("Error from BoutiqueVM: \(error)")
        }
    }
}
