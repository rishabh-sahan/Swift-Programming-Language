//
//  WeatherAppView.swift
//  MvvmOfWeatherApi
//
//  Created by BATCH03L1 on 31/10/25.
//

//
//  ContentView.swift
//  WeatherApp
//
//  Created by BATCH03L1 on 24/10/25.
//

import SwiftUI
import Charts

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text("Current Weather")
                .font(.largeTitle)
                .padding(.top, 40)
            
            Text("Temperature: \(viewModel.temperature) °C")
                .font(.title2)
                .padding(.top, 10)
            
            Text("Wind Speed: \(viewModel.windSpeed) km/h")
                .font(.title3)
                .padding(.bottom, 30)
            
            if viewModel.hourlyTemperatures.isEmpty {
                ProgressView("Loading hourly data...")
                    .padding()
            } else {
                Chart(viewModel.hourlyTemperatures) { item in
                    LineMark(
                        x: .value("Time", item.hour),
                        y: .value("Temp", item.temp)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(.blue)
                    .lineStyle(StrokeStyle(lineWidth: 3))
                }
                .chartXAxisLabel("Time (Hours)")
                .chartYAxisLabel("Temperature (°C)")
                .frame(height: 300)
                .padding()
            }
        }
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Error"),
                  message: Text(viewModel.errorMessage),
                  dismissButton: .default(Text("OK")))
        }
        .onAppear {
            viewModel.fetchWeather()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
