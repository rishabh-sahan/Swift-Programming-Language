//
//  ProjectApp.swift
//  Project
//
//  Created by BATCH03L1 on 09/10/25.
//

import SwiftUI
import Firebase
@main
struct ProjectApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
