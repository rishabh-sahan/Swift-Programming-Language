//
//  ContentView.swift
//  WeatherApp
//
//  Created by BATCH03L1 on 24/10/25.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State private var temperature: String = "---"
    @State private var windSpeed: String = "---"
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    @State private var hourlyTemperatures: [HourlyTemp] = []

    var body: some View {
        VStack {
            Text("Current Weather")
                .font(.largeTitle)
                .padding(.top, 40)
            
            Text("Temperature: \(temperature) °C")
                .font(.title2)
                .padding(.top, 10)
            
            Text("Wind Speed: \(windSpeed) km/h")
                .font(.title3)
                .padding(.bottom, 30)
            
            // MARK: - Smooth Line Chart (No Points)
            if hourlyTemperatures.isEmpty {
                ProgressView("Loading hourly data...")
                    .padding()
            } else {
                Chart(hourlyTemperatures) { item in
                    LineMark(
                        x: .value("Time", item.hour),
                        y: .value("Temp", item.temp)
                    )
                    .interpolationMethod(.catmullRom) // Smooth curve
                    .foregroundStyle(.blue)
                    .lineStyle(StrokeStyle(lineWidth: 3))
                }
                .chartXAxisLabel("Time (Hours)")
                .chartYAxisLabel("Temperature (°C)")
                .frame(height: 300)
                .padding()
            }
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Error"),
                  message: Text(errorMessage),
                  dismissButton: .default(Text("OK")))
        }
        .onAppear {
            let weatherService = WeatherAPIService()
            weatherService.fetchWeather { result in
                switch result {
                case .success(let weatherData):
                    DispatchQueue.main.async {
                        self.temperature = String(format: "%.1f", weatherData.current_weather.temperature)
                        self.windSpeed = String(format: "%.1f", weatherData.current_weather.windspeed)
                        
                        if let hourly = weatherData.hourly {
                            self.hourlyTemperatures = zip(hourly.time, hourly.temperature_2m)
                                .prefix(24) // Show next 24 hours
                                .map { HourlyTemp(hour: formatHour(from: $0.0), temp: $0.1) }
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.showError = true
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        }
        .padding()
    }
}

// MARK: - Model for Chart Data
struct HourlyTemp: Identifiable {
    let id = UUID()
    let hour: String
    let temp: Double
}

// MARK: - Helper
func formatHour(from isoString: String) -> String {
    let formatter = ISO8601DateFormatter()
    if let date = formatter.date(from: isoString) {
        let output = DateFormatter()
        output.dateFormat = "HH:mm"
        return output.string(from: date)
    }
    return isoString
}

#Preview {
    ContentView()
}
