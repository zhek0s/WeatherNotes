//
//  NoteDetailsView.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import SwiftUI

struct NoteDetailsView: View {

    let note: Note

    var body: some View {
        VStack(spacing: 16) {
            Text(note.text)
                .font(.title)
            Text(note.date.formatted())
            Text("\(note.temperature)°")
            Image(systemName: note.weatherCode)
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
            latitude: "0",
            longitude: "1",
            temperature: 12,
            weatherCode: "sun.max.fill",
            hourlyTemperature: [],
            hourlyWeatherCode: []
        ))
}
