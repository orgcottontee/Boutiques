//
//  Constants.swift
//  Boutiques
//
//  Created by adobada on 3/14/24.
//

import Foundation

struct Constants {
    
    enum AirtableAPI {
        static let value = "Bearer"
        static let header = "Authorization"
    }
    
    enum UnitedStatesAPI {
        // MARK: Can add in maxRecords or pageSize when I have more than 100 inputs to enable pagination
        static let baseURL = "https://api.airtable.com/v0/app3oZpEf8bSTrgCM/United%20States"
    }
}
