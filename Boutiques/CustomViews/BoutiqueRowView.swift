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
        VStack(alignment: .leading) {
            Text(boutique.fields.name)
                .font(.custom(BaskervilleFont.regular, size: 20))
                .kerning(2.0)
                .foregroundStyle(.accent)
            HStack {
                Text(boutique.fields.category)
                    .font(.custom(UniversFont.light, size: 12))
                    .kerning(2.0)
                    .foregroundStyle(.accent)
                Spacer()
                Text("\(boutique.fields.city), \(boutique.fields.state)")
                    .font(.custom(UniversFont.light, size: 12))
                    .kerning(2.0)
                    .foregroundStyle(.accent)
            }
            Divider()
        }
    }
}

#Preview {
    BoutiqueRowView(boutique: mockBoutiqueResponse)
}
