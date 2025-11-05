//
//  HomeScreen.swift
//  Assignment2
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.dismiss) private var Back
    @State private var ShowConfirmationDilog = false
    var body: some View {
        VStack {
            Text("HomePage")
                .font(.largeTitle)
                .fontWeight(.bold)
                
            .navigationBarBackButtonHidden()
        }
        
//        VStack {
//            Button("Show Confirmation Dialog") {
//                ShowConfirmationDilog = true
//            }
//        }
//        .confirmationDialog("Are you sure, you want to Logout ?", isPresented: $ShowConfirmationDilog, titleVisibility: .visible) {
//            Button("Logout", role: .destructive) {
//                Back()
//            }
//            Button("Cancel", role: .cancel) {
//                
//            }
//        } message: {
//            Text("This action cannot be undone")
//        }
        
        VStack{
            TabView {
                WelcomeHome()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                Students()
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
    }
}
#Preview {
    HomeScreen()
}
