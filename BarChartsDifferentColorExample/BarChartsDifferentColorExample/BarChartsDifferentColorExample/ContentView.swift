//
//  ContentView.swift
//  BarChartsDifferentColorExample
//
//  Created by BATCH03L1 on 24/10/25.
//

import SwiftUI
import Charts

struct BarData: Identifiable {
    var id = UUID()
    var category: String
    var value: Double
    var color: Color
    
}

struct ContentView: View {
    let barData: [BarData] = [
        BarData(category: "A", value: 10, color: .red),
        BarData(category: "B", value: 20, color: .blue),
        BarData(category: "C", value: 15, color: .green),
        BarData(category: "D", value: 25, color: .orange),
        BarData(category: "A", value: 5, color: .yellow),
        BarData(category: "B", value: 10, color: .purple),
        BarData(category: "C", value: 10, color: .pink),
    ]
    var body: some View {
        VStack {
            Text("Bar Chart Example")
                .font(.title)
                .padding()
            Chart(barData) { item in
                BarMark(
                    x: .value("Category", item.category),
                    y: .value("Value", item.value)
                )
                .foregroundStyle(item.color)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
