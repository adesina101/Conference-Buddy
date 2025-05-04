//
//  conference_buddyApp.swift
//  conference buddy
//
//  Created by Abdussalam Adesina on 4/29/25.
//

import SwiftUI
import SwiftData

@main
struct conference_buddyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainTabView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
