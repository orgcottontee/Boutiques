//
//  SettingsScreen.swift
//  Boutiques
//

//  Created by Kevin Mattocks on 3/27/24.

import SwiftUI

struct SettingsScreen: View {
    
    @AppStorage("appTheme") private var selectedAppTheme = AppTheme.system

    var selectedTheme: ColorScheme? {
        switch selectedAppTheme {
        case .lightTheme:
            return .light
        case .darkTheme:
            return .dark
        case .system:
            return nil
        }
    }
    var body: some View {
        NavigationStack {
                    Form {
                        Picker(selection: $selectedAppTheme) {
                            ForEach(AppTheme.allCases) { theme in
                                Text(theme.rawValue)
                                    .tag(theme)
                            }
                        } label: {
                            Label("Appearance", systemImage: "circle.righthalf.filled")
                        }


                        Section {
                            HStack {
                                Text("Version")
                                Spacer()
                                Text("1.0")
                            }

                        }


                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .preferredColorScheme(selectedTheme)
    }
}

#Preview {
    SettingsScreen()
}
