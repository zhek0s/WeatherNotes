//
//  WeatherChartData.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 12.02.2026.
//

import Foundation

struct WeatherChartData {
    let data: [WeatherChartPoint]
}

struct WeatherChartPoint: Identifiable {
    let id = UUID()
    let hour: String
    let temp: Float
    let weatherCode: String
}
