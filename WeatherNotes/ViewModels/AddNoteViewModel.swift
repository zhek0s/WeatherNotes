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
        
        let weather = try await weatherService.fetchWeather(latitude: "47.9057", longitude: "33.394") // TODO: get real values
        
        return Note(
            id: UUID(),
            text: text,
            date: Date(),
            temperature: Double(weather.current.temperature_2m),
            iconCode: ""
        )
    }
}

enum ValidationError: LocalizedError {
    case emptyText

    var errorDescription: String? {
        "Note text cannot be empty"
    }
}
