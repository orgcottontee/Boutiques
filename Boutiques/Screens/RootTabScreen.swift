//
//  RootTabScreen.swift
//  Boutiques
//
//  Created by adobada on 3/23/24.
//

import SwiftUI

struct RootTabScreen: View {
    
    @State private var selected: Constants.TabIcon = .door
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            VStack {
                TabView(selection: $selected) {
                    BoutiqueListScreen()
                        .tag(Constants.TabIcon.door)
                    MapScreen()
                        .tag(Constants.TabIcon.map)
                    FavoritesScreen()
                        .tag(Constants.TabIcon.heart)
                    SettingsScreen()
                        .tag(Constants.TabIcon.gear)
                }
                TabBarView(selected: $selected)
            }
        }
    }
}

#Preview {
    RootTabScreen()
}
