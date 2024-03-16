//
//  RootScreen.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import SwiftUI
import Observation

struct RootScreen: View {
    
    private var viewModel = UnitedStatesViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.boutiques, id: \.id) { boutique in
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
    }
}

#Preview {
    RootScreen()
}
