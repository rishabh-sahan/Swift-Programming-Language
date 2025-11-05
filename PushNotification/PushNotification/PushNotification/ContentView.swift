//
//  ContentView.swift
//  PushNotification
//
//  Created by BATCH03L1 on 05/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State private var showHome = false
    @State private var showProfile = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("welcome")
                    .font(.largeTitle)
                NavigationLink(destination: HomeView(), isActive: $showHome) {
                    HomeView()
                }
                NavigationLink(destination: ProfileView(), isActive: $showProfile) {
                    ProfileView()
                }
            }
            .onChange(of: appState.navigateTo) { newValue in
                guard let newValue = newValue else { return }
                switch newValue {
                case "HomeView":
                    showHome = true
                case "ProfileView":
                    showProfile = true
                default:
                    break
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
