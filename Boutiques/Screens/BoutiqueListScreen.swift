//
//  RootScreen.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import SwiftUI

struct BoutiqueListScreen: View {
    
    @State private var viewModel = BoutiqueViewModel()
    
    init() { NavBar.configureAppearance() }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(viewModel.filterResults, id: \.id) { boutique in
                            NavigationLink(value: boutique) {
                                BoutiqueRowView(boutique: boutique)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Menu {
                            Picker("", selection: $viewModel.filterStatus) {
                                ForEach(USState.allCases, id: \.id) { state in
                                    Text(state.stateAbbreviation)
                                        .tag(state)
                                }
                            }
                        } label: {
                            Text("Filter by State")
                        }
                    }
                }
                .navigationDestination(for: BoutiqueResponse.self) { boutique in
                    BoutiqueDetailScreen(boutique: boutique)
                }
                .task {
                    do {
                        try await viewModel.loadBoutiques()
                    } catch {
                        // use the swiftUI alerts to display error
                        print(error.localizedDescription)
                    }
                }
            }
            .searchable(text: $viewModel.searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Search boutique name..."
            )
        }
    }
}

#Preview {
    BoutiqueListScreen()
}
