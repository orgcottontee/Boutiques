//
//  UnitedStatesModel.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation

struct BoutiqueResponse: Codable, Hashable {
    let id: String
    let fields: BoutiqueDetail
}

struct Boutique: Codable, Hashable {
    let records: [BoutiqueResponse]
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
        
    }
}
