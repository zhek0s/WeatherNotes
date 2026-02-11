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
                        Image(systemName: note.iconCode)
                    }
                }
            }
            .navigationTitle("Weather Notes")
            .toolbar {
                NavigationLink(
                    destination: AddNoteView(
                        viewModel: AddNoteViewModel(),
                        onSave: { note in viewModel.add(note: note) }
                    )
                ) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    NotesListView()
}
