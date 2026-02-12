//
//  NoteUtilities.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 12.02.2026.
//

func convertNoteHourlyToChartsData(note: Note) -> WeatherChartData {
    let hours = 0...23
    var data: [WeatherChartPoint] = []
    for hour in hours {
        data.append(WeatherChartPoint(
            hour: String(hour),
            temp: note.hourlyTemperature[safe: hour] ?? 0,
            weatherCode: note.hourlyWeatherCode[safe: hour] ?? "",
        ))
    }
    return WeatherChartData(data: data)
}

extension Array {
    subscript(safe index: Int) -> Element? {
        guard indices ~= index else {
            return nil
        }
        return self[index]
    }
}
