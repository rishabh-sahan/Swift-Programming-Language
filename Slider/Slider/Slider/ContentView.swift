//
//  ContentView.swift
//  Slider
//
//  Created by BATCH03L1 on 20/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Double = 0.5
    var body: some View {
        VStack {
            Slider(value: $sliderValue, in: 0...10){
            }minimumValueLabel: {
                Text("0")
            }maximumValueLabel: {
                Text("10")
            }
            Text("Slider Value: \(sliderValue)")
            
            Button("Reset Slider"){
            }
            .opacity(sliderValue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
