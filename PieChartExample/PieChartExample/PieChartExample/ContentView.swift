//
//  ContentView.swift
//  PieChartExample
//
//  Created by BATCH03L1 on 24/10/25.
//

import SwiftUI
import Charts

struct PieChartData: Identifiable {
    var id = UUID()
    var category: String
    var value: Double
}

struct ContentView: View {
    let data: [PieChartData] = [
        PieChartData(category: "Category A", value: 30),
        PieChartData(category: "Category B", value: 20),
        PieChartData(category: "Category C", value: 50),
        PieChartData(category: "Category D", value: 15),
        PieChartData(category: "Category E", value: 40),
        PieChartData(category: "Category F", value: 55),
        PieChartData(category: "Category G", value: 58)
    ]
    var body: some View {
        VStack {
            Chart(data) { item in
                SectorMark(
                    angle: .value("Value", item.value),
                    innerRadius: .ratio(0.3),
                    angularInset: 6
                )
                .foregroundStyle(by: .value("Category", item.category))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
