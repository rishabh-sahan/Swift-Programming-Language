//
//  ContentView.swift
//  BarChartsExample
//
//  Created by BATCH03L1 on 24/10/25.
//

import SwiftUI
import Charts

struct BarData: Identifiable {
    let id = UUID()
    let category: String
    let value: Double
}

struct ContentView: View {
    let barData: [BarData] = [
        BarData(category: "A", value: 10),
        BarData(category: "B", value: 30),
        BarData(category: "C", value: 20),
        BarData(category: "D", value: 40),
        BarData(category: "E", value: 90),
        BarData(category: "F", value: 40),
    ]
    var body: some View {
        VStack {
            Text("Bar Chart Example")
                .font(.title)
                .padding()
            Chart(barData) { dataPoint in
                BarMark(
                    x: .value("Category", dataPoint.category),
                    y: .value("Value", dataPoint.value)
                )
            }
            .foregroundStyle(.green)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
