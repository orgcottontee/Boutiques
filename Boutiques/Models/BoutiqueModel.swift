//
//  UnitedStatesModel.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation



struct Boutique: Codable, Hashable {
    let records: [BoutiqueResponse]
}

struct BoutiqueResponse: Codable, Hashable {
    let id: String
    let fields: BoutiqueDetail
}


struct BoutiqueDetail: Codable, Hashable {
    let category: String
    let latitude: Double
    let state: String
    let longitude: Double
    let city: String
    let address: String
    let postalCode: Int
    let name: String
    let website: String?
    let logo: [Logo]?
    
    private enum CodingKeys: String, CodingKey {
        case category = "Category"
        case latitude = "Latitude"
        case state = "State"
        case longitude = "Longitude"
        case city = "City"
        case address = "Address"
        case postalCode = "Postal Code"
        case name = "Name"
        case website = "Website"
        case logo = "Logo"
        
    }
}

struct Logo: Codable, Hashable {
    let id: String
    let url: String
}


let mockBoutiqueDetail = BoutiqueDetail(category: "Apparel",
                                        latitude: 43.075195,
                                        state: "NY",
                                        longitude: -89.391917,
                                        city: "New York",
                                        address: "138 Sullivan St",
                                        postalCode: 10012,
                                        name: "& Son",
                                        website: "https://shopandson.com/",
                                        logo: [Logo(id: "attDbyoMeRtNHyzmz",
                                                    url: "https://shopandson.com/cdn/shop/files/IMG_2752.png?v=1710186018&width=352"
                                                   )]
                                        )

let mockBoutiqueResponse = BoutiqueResponse(id: "1",
                                            fields: mockBoutiqueDetail
)

let mockBoutique = Boutique(records: [mockBoutiqueResponse])
