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
            Image(systemName: note.iconCode)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NoteDetailsView(note: Note(id: UUID(), text: "Test text", date: Date(), temperature: 12, iconCode: "sun.max.fill"))
}
