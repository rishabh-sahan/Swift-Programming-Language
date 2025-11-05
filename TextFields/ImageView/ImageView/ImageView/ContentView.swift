//
//  ContentView.swift
//  ImageView
//
//  Created by BATCH03L1 on 20/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "")
            
            Image("flower")
                .resizable()
                .frame(width: 400, height: 400)
                .clipShape(Circle())
                .overlay(Circle() .stroke(Color.red, lineWidth: 2))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
