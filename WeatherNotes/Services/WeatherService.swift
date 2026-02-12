//
//  WeatherService.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 12.02.2026.
//

import Foundation

class WeatherService: WeatherServiceProtocol {
    func fetchWeather(latitude: String, longitude: String) async throws -> WeatherRespose {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&hourly=weather_code,temperature_2m&current=temperature_2m,weather_code&forecast_days=1")
        else {
            throw WeatherError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode
        else {
            throw WeatherError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(WeatherRespose.self, from: data)
        } catch {
            throw WeatherError.decodingError
        }
    }
    
    
}

enum WeatherError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .invalidResponse: return "Server error"
        case .decodingError: return "Failed to parse weather data"
        }
    }
}
