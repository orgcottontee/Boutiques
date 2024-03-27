//
//  AppTheme.swift
//  Boutiques
//
//  Created by Kevin Mattocks on 3/27/24.
//

import Foundation

enum AppTheme: String, Identifiable, CaseIterable {
    case system = "System"
    case lightTheme = "Light"
    case darkTheme = "Dark"

    var id: String {
        self.rawValue
    }

}
