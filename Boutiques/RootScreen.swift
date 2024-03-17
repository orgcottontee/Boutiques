//
//  RootScreen.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import SwiftUI
import Observation

struct RootScreen: View {
    
    @State private var viewModel = UnitedStatesViewModel()
    @State private var searchText: String = ""
    @State private var filteredBoutiques: [USBoutiqueRecord] = []
    
    private func performSearch(keyword: String) {
        filteredBoutiques = viewModel.boutiques.filter { boutique in
            boutique.fields.name.contains(keyword)
        }
    }
    
    private var boutiques: [USBoutiqueRecord] {
        filteredBoutiques.isEmpty ? viewModel.boutiques : filteredBoutiques
    }
    
    var body: some View {
        NavigationStack {
            List(boutiques, id: \.id) { boutique in
                HStack {
                    Text(boutique.fields.name)
                    Spacer()
                    Text(boutique.fields.state)
                }
            }
            .task {
                do {
                    try await viewModel.getBoutiques()
                } catch {
                    // use the swiftUI alerts to display error
                    print("\(NetworkError.badRequest) from RootScreen")
                }
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) {
            performSearch(keyword: searchText)
        }
    }
}

#Preview {
    RootScreen()
}
