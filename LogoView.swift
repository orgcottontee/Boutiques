//
//  LogoView.swift
//  Boutiques
//
//  Created by adobada on 3/25/24.
//

import SwiftUI

struct LogoView: View {
    
    let boutique: BoutiqueResponse
    
    /*
     Need to update logo:
   
     Shop bosewell
     Today clothing
     */
    
    var body: some View {
        ZStack {
            VStack {
                if let url = boutique.fields.logo?.last?.url {
                    AsyncImage(url: URL(string: url)) { phase in
                        switch phase {
                        case .empty:
                            Text("Unknown logo")
                                .font(.custom(BaskervilleFont.italic, size: 30))
                                .kerning(5.0)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        case .failure:
                            Text("Unable to load")
                                .font(.custom(BaskervilleFont.italic, size: 15))
                                .kerning(5.0)
                        @unknown default:
                            Text("Error...Sorry")
                                .font(.custom(BaskervilleFont.italic, size: 15))
                                .kerning(5.0)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(width: 250, height: 300)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
        .shadow(color: .background, radius: 8, x: 5 , y: 5)
    }
}

#Preview {
    LogoView(boutique: mockBoutiqueResponse)}
