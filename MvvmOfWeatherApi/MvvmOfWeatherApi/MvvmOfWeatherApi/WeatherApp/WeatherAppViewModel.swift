//
//  WeatherAppViewModel.swift
//  MvvmOfWeatherApi
//
//  Created by BATCH03L1 on 31/10/25.
//

//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by BATCH03L1 on 24/10/25.
//

import Foundation
import Combine

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var temperature: String = "---"
    @Published var windSpeed: String = "---"
    @Published var hourlyTemperatures: [HourlyTemp] = []
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    private let service = WeatherAPIService()
    
    func fetchWeather() {
        service.fetchWeather { [weak self] result in
            switch result {
            case .success(let weatherData):
                Task { @MainActor in
                    self?.temperature = String(format: "%.1f", weatherData.current_weather.temperature)
                    self?.windSpeed = String(format: "%.1f", weatherData.current_weather.windspeed)
                    
                    if let hourly = weatherData.hourly {
                        self?.hourlyTemperatures = zip(hourly.time, hourly.temperature_2m)
                            .prefix(24)
                            .map { HourlyTemp(hour: formatHour(from: $0.0), temp: $0.1) }
                    }
                }
            case .failure(let error):
                Task { @MainActor in
                    self?.showError = true
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
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
