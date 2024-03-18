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
    static let value = "Bearer"
    static let header = "Authorization"
}

enum CountryAPIs {
    
    enum UnitedStates: API {
        // MARK: Can add in cases such as maxRecords or pageSize when I have more than 100 inputs to enable pagination

        static let baseURL = "https://api.airtable.com/v0/app3oZpEf8bSTrgCM/tblI63lmPCaLV96Za"
    }
    
    enum Canada: API {
        static let baseURL = "https://api.airtable.com/v0/app3oZpEf8bSTrgCM/tblfGK5ahT1eaPJa1"
    }
}
