//
//  NoteListViewModel.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import Foundation

class NoteListViewModel: ObservableObject {
    
    @Published var notes: [Note] = []
    private let storage: StorageServiceProtocol
    
    init(storage: StorageServiceProtocol) {
        self.storage = storage
        load()
    }
    
    func load() {
        notes = storage.loadNotes()
    }
    
    func add(note: Note) {
        notes.insert(note, at: 0)
        storage.save(notes: notes)
    }
}
