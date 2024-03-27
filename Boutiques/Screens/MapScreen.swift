//
//  MapScreen.swift
//  Boutiques
//
//  Created by adobada on 3/23/24.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    
    @State private var viewModel = MapViewModel()
    
    var body: some View {
        Map(initialPosition: viewModel.camera) {
            ForEach(viewModel.boutiques, id: \.id) { boutique in
                Annotation(boutique.fields.name,
                           coordinate: CLLocationCoordinate2D(latitude: boutique.fields.latitude,
                                                              longitude: boutique.fields.longitude)
                ) {
                    ZStack {
                        Circle()
                            .foregroundStyle(.black.opacity(0.75))
                    }
                }
            }
        }
        .mapStyle(.hybrid)
        .mapControls {
            MapCompass()
            MapPitchToggle()
        }
        .task {
            do {
                try await viewModel.loadBoutiques()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    MapScreen()
}
