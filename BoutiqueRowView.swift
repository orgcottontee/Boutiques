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
            Spacer()
            Text(boutique.fields.state)
        }
    }
}

//#Preview {
//    BoutiqueRowView()
//}
