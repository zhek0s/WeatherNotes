//
//  StorageService.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import Foundation

class StorageService: StorageServiceProtocol {
    private let key = "notes"
    
    func save(notes: [Note]) {
        let data = try? JSONEncoder().encode(notes)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadNotes() -> [Note] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let notes = try? JSONDecoder().decode([Note].self, from: data) else {
            return []
        }
        return notes
    }
}
