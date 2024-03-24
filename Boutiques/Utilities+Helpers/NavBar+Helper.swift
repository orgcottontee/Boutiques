//
//  NavBar+Helper.swift
//  Boutiques
//
//  Created by adobada on 3/23/24.
//

import SwiftUI

struct NavBar {
    
    static func configureAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color(.background))
        
        let cancelButton = [NSAttributedString.Key.foregroundColor: UIColor.accent]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButton, for: .normal)
        
        UINavigationBar.appearance().tintColor = .accent
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
    }
}
