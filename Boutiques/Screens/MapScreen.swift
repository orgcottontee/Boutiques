//
//  MapScreen.swift
//  Boutiques
//
//  Created by adobada on 3/23/24.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            Map(initialPosition: .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))))        }
    }
}

#Preview {
    MapScreen()
}
