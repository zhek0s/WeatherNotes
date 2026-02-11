//
//  StorageServiceProtocol.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

protocol StorageServiceProtocol {
    func save(notes: [Note])
    func loadNotes() -> [Note]
}
