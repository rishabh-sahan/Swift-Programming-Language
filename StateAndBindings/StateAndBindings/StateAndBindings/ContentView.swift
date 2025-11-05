//
//  ContentView.swift
//  StateAndBindings
//
//  Created by BATCH03L1 on 24/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    var body: some View {
        VStack {
           Text("Count: \(count)")
                .font(.largeTitle)
            Button(action : {
                count += 1
            }) {
                Text("Increment")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
