//
//  WeatherUtilities.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 12.02.2026.
//

func iconForWMO(code: Int) -> String {
    switch code {
    case 0: return "sun.max.fill"
    case 1, 2, 3: return "cloud.sun.fill"
    case 45, 48: return "cloud.fog.fill"
    case 51, 53, 55: return "cloud.drizzle.fill"
    case 61, 63, 65: return "cloud.rain.fill"
    case 71, 73, 75, 77: return "cloud.snow.fill"
    case 80, 81, 82: return "cloud.heavyrain.fill"
    case 95: return "cloud.bolt.fill"
    case 96, 99: return "cloud.bolt.rain.fill"
    default: return "questionmark.diamond"
    }
}
