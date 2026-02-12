//
//  NoteDetailsView.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import SwiftUI
import Charts

struct NoteDetailsView: View {

    let note: Note

    var body: some View {
            VStack(spacing: 16) {
                Text(note.text)
                    .font(.title)
                Text("Date: \(note.date.formatted())")
                Text(String(format: "Temperature: %.1f°C", note.temperature))
                Text("Position: \(note.latitude), \(note.longitude)")
                Image(systemName: note.weatherCode)
                Text("Weather at that day:")
                Chart(convertNoteHourlyToChartsData(note: note).data) { point in
                    PointMark(
                        x: .value("Time", point.hour),
                        y: .value("Temp", point.temp)
                    )
                    .annotation(position: .top, alignment: .center) {
                        VStack(spacing: 4) {
                            Image(
                                systemName: point.weatherCode
                            )                            }
                        .imageScale(.medium)
                    }
                }
                .frame(height: 200)
                Spacer()
            }
            .padding()
        }
}

#Preview {
    NoteDetailsView(
        note: Note(
            id: UUID(),
            text: "Test text",
            date: Date(),
            latitude: "47.9057",
            longitude: "33.394",
            temperature: 12,
            weatherCode: "sun.max.fill",
            hourlyTemperature: [0.0,
                                0.2,
                                0.3,
                                0.5,
                                0.8,
                                0.9,
                                1.4,
                                1.8,
                                2.6,
                                4.1,
                                4.8,
                                5.7,
                                6.2,
                                6.5,
                                6.1,
                                5.6,
                                5.3,
                                4.7,
                                4.2,
                                3.6,
                                3.2,
                                2.8,
                                2.3,
                                2.0],
            hourlyWeatherCode: []
        ))
}
