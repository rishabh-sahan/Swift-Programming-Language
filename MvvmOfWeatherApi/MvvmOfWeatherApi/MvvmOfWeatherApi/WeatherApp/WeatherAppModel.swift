//
//  WeatherAppModel.swift
//  MvvmOfWeatherApi
//
//  Created by BATCH03L1 on 31/10/25.
//

//
//  WeatherData.swift
//  WeatherApp
//
//  Created by BATCH03L1 on 24/10/25.
//

import Foundation

// MARK: - Weather Data Models
struct WeatherData: Decodable {
    let latitude: Double
    let longitude: Double
    let current_weather: CurrentWeather
    let hourly: HourlyWeather?
}

struct CurrentWeather: Decodable {
    let temperature: Double
    let windspeed: Double
    let weathercode: Int
}

struct HourlyWeather: Decodable {
    let time: [String]
    let temperature_2m: [Double]
}

// MARK: - Model for Chart Data
struct HourlyTemp: Identifiable {
    let id = UUID()
    let hour: String
    let temp: Double
}
