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
        VStack {
            Text(boutique.fields.name)
            Text(boutique.fields.category)
            Text(boutique.fields.website ?? "No website yet")
            Text(boutique.fields.city)
        }
    }
}

//#Preview {
//    BoutiqueDetailScreen()
//}
