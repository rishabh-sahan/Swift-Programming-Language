//
//  SearchView.swift
//  TabBarView
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI
struct SerachView: View {
    var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            Text("Search View")
                .font(.largeTitle)
        }
    }
}

