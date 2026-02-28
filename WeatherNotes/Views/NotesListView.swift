//
//  NotesListView.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import SwiftUI

struct NotesListView: View {

    @ObservedObject private var viewModel = NoteListViewModel(storage: StorageService())

    var body: some View {
        NavigationView {
            List(viewModel.notes) { note in
                NavigationLink(destination: NoteDetailsView(note: note)) {
                    VStack(alignment: .leading) {
                        Text(note.text)
                        Text(note.date.formatted())
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Text("\(Int(note.temperature))°")
                        Image(systemName: note.weatherCode)
                    }
                }
            }
            .navigationTitle("Weather Notes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination:
                        AddNoteView(
                            viewModel: AddNoteViewModel(
                                weatherService: WeatherService()
                            ),
                            onSave: { note in
                                viewModel.add(note: note)
                            }
                        )
                    ) {
                        Image(systemName: "plus")
                    }
                }

                // ⚙️ Настройки
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .background(AppColors.background)
        }
    }
}

#Preview {
    NotesListView()
}
