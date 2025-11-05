
//
//  ProfileView.swift
//  TabBarView
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI
struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "profile.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            Text("Profile View")
                .font(.largeTitle)
        }
    }
}

