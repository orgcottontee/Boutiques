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
        // var mapSelection: MKMapItem? (this uses the actual map's data. Since I"m fetching from API, I'll need to create my own pop up")
        
        var camera: MapCameraPosition = .region(.init(center: CLLocationCoordinate2D(latitude: Constants.MapScreen.initialLatitude,
                                                                                     longitude: Constants.MapScreen.initialLongitude),
                                                      span: MKCoordinateSpan(latitudeDelta: Constants.MapScreen.latitudeDelta,
                                                                             longitudeDelta: Constants.MapScreen.longitudeDelta))
                                                )

        // MARK: - Actions
        
        @MainActor
        func loadBoutiques() async throws {
            do {
                boutiques = try await NetworkManager.shared.fetchBoutiqueForMap()
            } catch {
                print("Error from mapVM: \(error)")
            }
        }
    }
}

