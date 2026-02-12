//
//  WeatherServiceProtocol.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

protocol WeatherServiceProtocol {
    func fetchWeather(latitude: String, longitude: String) async throws -> WeatherRespose
}
