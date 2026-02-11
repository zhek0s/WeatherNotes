//
//  AddNoteViewModel.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import Foundation

class AddNoteViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var errorMessage: String?
    
    func createNote() throws -> Note {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw ValidationError.emptyText
        }
        
        return Note(
            id: UUID(),
            text: text,
            date: Date(),
            temperature: 0,
            iconCode: ""
        )
    }
}

enum ValidationError: LocalizedError {
    case emptyText

    var errorDescription: String? {
        "Note text cannot be empty"
    }
}
