//
//  ContentView.swift
//  Stepper
//
//  Created by BATCH03L1 on 20/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 0
    var body: some View {
        VStack {
            Stepper("Value: \(value)", value:
                        $value, in: 0...10)
            if value == 10 {
                Text("dead end")
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
