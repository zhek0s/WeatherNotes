//
//  SettingsView.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 28.02.2026.
//

import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var themeService: ThemeService

    var body: some View {
        Form {
            Picker("Theme", selection: $themeService.selectedTheme) {
                ForEach(AppTheme.allCases, id: \.self) { theme in
                    Text(theme.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
        }
        .navigationTitle("Appearance")
    }
}
