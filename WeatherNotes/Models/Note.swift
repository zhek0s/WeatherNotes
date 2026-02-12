//
//  Note.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
    let date: Date
    let latitude: String
    let longitude: String
    let temperature: Float
    let weatherCode: String
    let hourlyTemperature: [Float]
    let hourlyWeatherCode: [String]
}
