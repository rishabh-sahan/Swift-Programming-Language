//
//  SwiftDataBaseApp.swift
//  SwiftDataBase
//
//  Created by BATCH03L1 on 25/10/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataBaseApp: App {
    let container = try! ModelContainer(for: Task.self)
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(container)
        }
    }
}
