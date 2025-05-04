import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }

            AIChatView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("AI Chat")
                }

            NotesView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Notes")
                }
        }
    }
}
//
//  TabView.swift
//  conference buddy
//
//  Created by Abdussalam Adesina on 4/30/25.
//

