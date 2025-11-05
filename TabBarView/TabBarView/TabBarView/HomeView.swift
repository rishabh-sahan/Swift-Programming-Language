//
//  HomeView.swift
//  TabBarView
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            Text("Home View")
                .font(.largeTitle)
        }
    }
}

