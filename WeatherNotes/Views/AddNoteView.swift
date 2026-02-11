//
//  AddNoteView.swift
//  WeatherNotes
//
//  Created by Евгений Корженевский on 11.02.2026.
//

import SwiftUI

struct AddNoteView: View {
    
    @ObservedObject var viewModel: AddNoteViewModel
    let onSave: (Note) -> Void
    
    var body: some View {
        VStack {
            TextEditor(text: $viewModel.text)
                .padding()
            
            Button("Save") {
                Task {
                    do{
                        let note = try viewModel.createNote()
                        onSave(note)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    AddNoteView(viewModel: AddNoteViewModel(), onSave: {note in print(note)})
}
