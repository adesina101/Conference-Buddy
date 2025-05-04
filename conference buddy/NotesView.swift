import SwiftUI

struct NotesView: View {
    @State private var suggestions: [String] = [
        "Prepare your personal elevator pitch",
        "Research keynote speakers in advance"
    ]
    @State private var newSuggestion: String = ""
    @State private var isEditing: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    ForEach(suggestions, id: \.self) { suggestion in
                        NavigationLink(destination: Text(suggestion)) {
                            Text(suggestion)
                        }
                    }
                    .onDelete(perform: deleteSuggestion)
                }
                .listStyle(InsetGroupedListStyle())
                
                Divider()

                // Bottom input field
               
                .padding(.vertical, 8)
                .background(Color(.white))
            }
            .navigationTitle("Notes")
            .navigationBarItems(leading: EditButton())
        }
    }

    private func deleteSuggestion(at offsets: IndexSet) {
        suggestions.remove(atOffsets: offsets)
    }
}

//  NotesView.swift
//  conference buddy
//
//  Created by Abdussalam Adesina on 4/30/25.
//

