//
//  BoutiqueDetailScreen.swift
//  Boutiques
//
//  Created by adobada on 3/21/24.
//

import SwiftUI

struct BoutiqueDetailScreen: View {
    
    let boutique: BoutiqueResponse
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            VStack {
                LogoView(boutique: boutique)
                Spacer()
                Text(boutique.fields.name)
                Text(boutique.fields.category)
                Text(boutique.fields.website ?? "No website yet")
                Text(boutique.fields.city)
            }
            .padding()
        }
    }
}

#Preview {
    BoutiqueDetailScreen(boutique: mockBoutiqueResponse)
}
