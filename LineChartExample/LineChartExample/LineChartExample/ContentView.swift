//
//  ContentView.swift
//  LineChartExample
//
//  Created by BATCH03L1 on 24/10/25.
//

import SwiftUI
import Charts

struct LineChartDataPoint: Identifiable {
    let id = UUID()
    let category: String
    let value: Double
}

struct ContentView: View {
    var data: [LineChartDataPoint] = [
        LineChartDataPoint(category: "Jan", value: 150),
        LineChartDataPoint(category: "Feb", value: 200),
        LineChartDataPoint(category: "Mar", value: 170),
        LineChartDataPoint(category: "Apr", value: 220),
        LineChartDataPoint(category: "May", value: 190),
        LineChartDataPoint(category: "Jun", value: 250)
    ]
    var body: some View {
        VStack {
            Text("Monthly Sales Data")
                .font(.title)
                .padding()
            Chart(data) { point in
                LineMark(
                    x: .value("Month", point.category),
                    y: .value("Sales", point.value)
                )
                .foregroundStyle(.green)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
