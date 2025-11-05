//
//  ContentView.swift
//  Buttons
//
//  Created by BATCH03L1 on 20/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Hit Me!!") {
                print("You Ediot Stop It!!")
            }
            
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .font(.largeTitle)
            
            Button(action: {
                print("Button Pressed!!")
            }) {
                Text("Login👾")
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
