//
//  ContentView.swift
//  SegmentController
//
//  Created by BATCH03L1 on 20/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var sliderValue = 0.5
    @State private var value = 0
    @State private var isOn: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // Title Section
            Text("Workout Config")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // General Section
            Text("GENERAL")
                .font(.headline)

            Toggle(isOn: $isOn) {
                Text("Enable Sound")
            }
            .toggleStyle(SwitchToggleStyle(tint: .red))

            Text("WORKOUT SETTNGS")
                .fontWeight(.light)
            Text("Duration: 30 sec")
                .fontWeight(.bold)

            // Slider
            VStack(alignment: .leading) {
                Slider(value: $sliderValue, in: 0...100,step: 10) {
                    Text("Slider")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("10")
                }

                Text("Slider Value: \(sliderValue, specifier: "%.2f")")
                
                Button("Reset Slider") {
                    sliderValue = 0.0
                }
                .opacity(sliderValue)
            }

            // Stepper
            Stepper("Value: \(value)", value: $value, in: 0...10)

            if value == 10 {
                Text("Dead end")
                    .padding(.top)
                    .foregroundColor(.red)
            }

            // Segmented Picker
            Picker("Options", selection: $selection) {
                Text("First").tag(0)
                Text("Second").tag(1)
                Text("Third").tag(2)
            }
            .pickerStyle(.segmented)

           
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
