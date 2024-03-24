//
//  RootTabScreen.swift
//  Boutiques
//
//  Created by adobada on 3/23/24.
//

import SwiftUI

struct RootTabScreen: View {
    
    @State private var selected: TabIcon = .door
    
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
                        .tag(TabIcon.door)
                    MapScreen()
                        .tag(TabIcon.map)
                    FavoritesScreen()
                        .tag(TabIcon.heart)
                    SettingsScreen()
                        .tag(TabIcon.gear)
                }
                TabBarView(selected: $selected)
            }
        }
    }
}

#Preview {
    RootTabScreen()
}
