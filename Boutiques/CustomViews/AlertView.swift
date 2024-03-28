//
//  AlertView.swift
//  Boutiques
//
//  Created by adobada on 3/27/24.
//

import SwiftUI

struct AlertView: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
    var alert: Alert {
        Alert(title: title, message: message, dismissButton: dismissButton)
    }
}

struct AlertContext {
    
    // MARK: - Map screen errors
    
    // MARK: - Boutique list errors
    
    
}
