//
//  NotesListView.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import SwiftUI

struct NotesListView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("NotesListView")
            }
            .navigationTitle("Weather Notes")
            .toolbar {
                NavigationLink(destination: AddNoteView()
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
