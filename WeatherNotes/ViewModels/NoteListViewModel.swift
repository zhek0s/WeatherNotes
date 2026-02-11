//
//  NoteListViewModel.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import Foundation

class NoteListViewModel: ObservableObject {
    @Published var notes: [Note] = []
    
    func add(note: Note) {
        notes.insert(note, at: 0)
    }
}
