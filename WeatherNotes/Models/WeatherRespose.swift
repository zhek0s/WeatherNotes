//
//  WeatherRespose.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import Foundation

struct WeatherRespose: Codable {
    let current: CurrentWeather
    let hourly: HourlyWeather
}

struct CurrentWeather: Codable {
    let time: String
    let temperature_2m: Float
    let weather_code: Int
}

struct HourlyWeather: Codable {
    let temperature_2m: [Float]
    let weather_code: [Int]
}
