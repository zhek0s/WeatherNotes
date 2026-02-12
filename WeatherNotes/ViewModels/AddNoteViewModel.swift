//
//  AddNoteViewModel.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import Foundation

class AddNoteViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var errorMessage: String?
    
    private let weatherService: WeatherServiceProtocol
    
    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }
    
    func createNote() async throws -> Note {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw ValidationError.emptyText
        }
        
        // TODO: get real values
        let lat = "47.9057"
        let lon = "33.394"
        
        let weather = try await weatherService.fetchWeather(latitude: lat, longitude: lon)
        
        return Note(
            id: UUID(),
            text: text,
            date: Date(),
            latitude: lat,
            longitude: lon,
            temperature: weather.current.temperature_2m,
            weatherCode: String(weather.current.weather_code), // TODO: get native ios icon from wmo code
            hourlyTemperature: weather.hourly.temperature_2m,
            hourlyWeatherCode: weather.hourly.weather_code.map { String($0) } // TODO: get native ios icon from wmo code
        )
    }
}

enum ValidationError: LocalizedError {
    case emptyText

    var errorDescription: String? {
        "Note text cannot be empty"
    }
}
