//
//  APIs.swift
//  Boutiques
//
//  Created by adobada on 3/18/24.
//

import Foundation

protocol API {
    static var baseURL: String { get }
}

enum AirtableAPI {
    // MARK: Can add in cases such as maxRecords or pageSize when I have more than 100 inputs to enable pagination
    static let value = "Bearer"
    static let header = "Authorization"
    static let sortByName = "Name"
    static let sortByAsc = "asc"
    
    enum UnitedStates: API {
        static let baseURL = "https://api.airtable.com/v0/app3oZpEf8bSTrgCM/tblI63lmPCaLV96Za"
    }
}
