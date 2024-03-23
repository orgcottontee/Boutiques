//
//  RootScreen.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import SwiftUI

struct RootScreen: View {
    
    @State private var viewModel = BoutiqueViewModel()
    @State private var searchText: String = ""
    @State private var filteredBoutiques: [BoutiqueResponse] = []
    
    private func performSearch(keyword: String) {
        filteredBoutiques = boutiques.filter { boutique in
            boutique.fields.name.localizedCaseInsensitiveContains(keyword)
        }
    }
    
    private var boutiques: [BoutiqueResponse] {
        filteredBoutiques.isEmpty ? viewModel.boutiques : filteredBoutiques
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(boutiques, id: \.id) { boutique in
                        NavigationLink(value: boutique) {
                            BoutiqueRowView(boutique: boutique)
                                .foregroundStyle(.black)
                        }
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
        /* TODO: Seems like an Apple bug, but keep an eye out. Getting this error "If you want to see the backtrace, please set CG_NUMERICS_SHOW_BACKTRACE environmental variable.Error: this application, or a library it uses, has passed an invalid numeric value (NaN, or not-a-number) to CoreGraphics API and this value is being ignored. Please fix this problem.
         */
        .searchable(text: $searchText)
        .onChange(of: searchText) {
            performSearch(keyword: searchText)
        }
    }
}

#Preview {
    RootScreen()
}
