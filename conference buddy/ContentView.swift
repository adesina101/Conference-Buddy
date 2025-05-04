//
//  ContentView.swift
//  conference buddy
//
//  Created by Abdussalam Adesina on 4/29/25.
//

import SwiftUI
import SwiftData

struct WelcomeView: View{
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Welcome to Nexora")
                .font(.largeTitle)
                .bold()
            
            Text("Your personal conference assistant. Get the most out of every conference you go to.")
                .font(.title3)
                .foregroundColor(.gray)
        }
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        VStack (alignment: .leading, spacing: 20){
                            Image("")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: .infinity)
                                .cornerRadius(12)
                            Text("Item at \(item.timestamp.formatted(date: .complete, time: .complete))")
                                   Text("Welcome to Nexora, your personal conference assistant. Get the most out of every conference you go to")
                        
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        Text("more details here")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            Spacer()
                            
                            HStack(spacing: 20) {
                                Button(action: {
                                    print("Profile tapped for \(item.timestamp)")
                                }){
                                    Image(systemName: "person.crop.circle")
                                        .font(.title3)
                                        .padding(10)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                                Button(action: {
                                    print("Chat tapped for \(item.timestamp)")
                                }){
                                    Image(systemName: "bubble.left.and.bubble.right.fill")
                                        .font(.title3)
                                        .padding(10)
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                                Button(action: {
                                    print("Notes tapped for \(item.timestamp)")
                                }) {
                                    Image(systemName: "note.text")
                                        .font(.title3)
                                        .padding(10)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                            }
                        }
                        .padding()
                    } label: {
                        
                        HStack{
                            Image(systemName: "calendar")
                                .foregroundColor(.blue)
                            
                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            WelcomeView()
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
