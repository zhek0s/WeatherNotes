//
//  ThemeService.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 28.02.2026.
//

import SwiftUI

@MainActor
final class ThemeService: ObservableObject {

    @Published var selectedTheme: AppTheme {
        didSet {
            UserDefaults.standard.set(selectedTheme.rawValue, forKey: "app_theme")
        }
    }

    init() {
        if let raw = UserDefaults.standard.string(forKey: "app_theme"),
           let theme = AppTheme(rawValue: raw) {
            selectedTheme = theme
        } else {
            selectedTheme = .system
        }
    }
}
