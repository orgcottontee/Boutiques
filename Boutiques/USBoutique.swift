//
//  UnitedStatesModel.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation

struct USBoutiqueRecord: Codable {
    let id: String
    let fields: USBoutique
}

struct USBoutiqueResponse: Codable {
    let records: [USBoutiqueRecord]
}

struct USBoutique: Codable {
    let category: String
    let latitude: Double
    let state: String
    let longitude: Double
    let city: String
    let address: String
    let postalCode: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case category = "Category"
        case latitude = "Latitude"
        case state = "State"
        case longitude = "Longitude"
        case city = "City"
        case address = "Address"
        case postalCode = "Postal Code"
        case name = "Name"
        
    }
}
