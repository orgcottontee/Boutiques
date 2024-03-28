//
//  AppTheme.swift
//  Boutiques
//
//  Created by adobada on 3/28/24.
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
