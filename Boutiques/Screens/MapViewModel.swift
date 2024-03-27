//
//  MapViewModel.swift
//  Boutiques
//
//  Created by adobada on 3/27/24.
//

import MapKit
import SwiftUI

extension MapScreen {
    
    @Observable
    final class MapViewModel {
        
        // MARK: - Properties
        
        private(set) var boutiques: [BoutiqueResponse] = []
     
        
        var camera: MapCameraPosition = .region(.init(center: CLLocationCoordinate2D(latitude: 39.831395,
                                                                                     longitude: -98.450229),
                                                      span: MKCoordinateSpan(latitudeDelta: 50.0,
                                                                             longitudeDelta: 50.0))
                                                )

        // MARK: - Actions
        
        @MainActor
        func loadBoutiques() async throws {
            
            do {
                boutiques = try await NetworkManager.shared.fetchBoutiqueForMap()
            } catch {
                print(error.localizedDescription)
                throw NetworkError.badGateway
            }
        }
    }
}

