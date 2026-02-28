//
//  WeatherNotesApp.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import SwiftUI

@main
struct WeatherNotesApp: App {
    
    @StateObject private var themeService = ThemeService()

    var body: some Scene {
        WindowGroup {
            NotesListView()
                .environmentObject(themeService)
                .preferredColorScheme(themeService.selectedTheme.colorScheme)
        }
    }
}
