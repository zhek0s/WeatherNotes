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
    let temperature: Double
    let iconCode: String
}
