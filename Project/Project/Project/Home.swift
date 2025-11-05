//
//  Home.swift
//  Project
//
//  Created by BATCH03L1 on 09/10/25.
//


import SwiftUI

struct HomeScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showLogoutConfirmation = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Home Page")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                TabView {
                    WelcomeHome()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }

                    Students()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }

                    AddStudent()
                        .tabItem {
                            Image(systemName: "person.2.fill")
                            Text("Students")
                        }

                    Profile()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Logout") {
                        showLogoutConfirmation = true
                    }
                }
            }
            .confirmationDialog(
                "Are you sure you want to log out?",
                isPresented: $showLogoutConfirmation,
                titleVisibility: .visible
            ) {
                Button("Logout", role: .destructive) {
                    dismiss()
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("This action will log you out of the app.")
            }
        }
    }
}

#Preview {
    HomeScreen()
}
