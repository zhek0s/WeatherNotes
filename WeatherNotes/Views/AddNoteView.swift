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
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            TextEditor(text: $viewModel.text)
                .padding()
            
            Button("Save") {
                Task {
                    do{
                        let note = try viewModel.createNote()
                        onSave(note)
                        dismiss()
                    } catch {
                        viewModel.errorMessage = error.localizedDescription
                    }
                }
            }
            .alert("Error",
                    isPresented: Binding(
                     get: { viewModel.errorMessage != nil },
                     set: { _ in viewModel.errorMessage = nil })
             ) {
                 Button("OK", role: .cancel) {}
             } message: {
                 Text(viewModel.errorMessage ?? "")
             }
        }
    }
}

#Preview {
    AddNoteView(viewModel: AddNoteViewModel(), onSave: {note in print(note)})
}
