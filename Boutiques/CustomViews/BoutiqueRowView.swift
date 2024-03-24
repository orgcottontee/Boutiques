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
            Text(boutique.fields.name)
                .font(.custom(BaskervilleFont.regular, size: 20))
                .kerning(2.0)
                .foregroundStyle(.accent)
            Spacer()
            Text("\(boutique.fields.city), \(boutique.fields.state)")
                .font(.custom(BaskervilleFont.regular, size: 20))
                .foregroundStyle(.accent)
        }
        .padding()
    }
}

#Preview {
    BoutiqueRowView(boutique: mockBoutiqueResponse)
}
