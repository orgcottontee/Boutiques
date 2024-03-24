//
//  BoutiqueRowView.swift
//  Boutiques
//
//  Created by adobada on 3/21/24.
//

import SwiftUI

struct BoutiqueRowView: View {
    
    let boutique: BoutiqueResponse
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: boutique.fields.logo?.last?.url ?? "No logo available")) { phase in
                switch phase {
                case .empty:
                    Text("no available logo")
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                case .failure:
                    Text("unable to load")
                @unknown default:
                    EmptyView()
                }
            }
            Spacer()
            Text(boutique.fields.name)
                .font(.custom(BaskervilleFont.regular, size: 20))
                .kerning(2.0)
                .foregroundStyle(.accent)
            Spacer()
            Text(boutique.fields.state)
                .font(.custom(BaskervilleFont.regular, size: 20))
                .foregroundStyle(.accent)
        }
        .padding()
    }
}

#Preview {
    BoutiqueRowView(boutique: mockBoutiqueResponse)
}
