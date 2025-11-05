//
//  WeatherAPIService.swift
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

// MARK: - API Service
class WeatherAPIService {
    func fetchWeather(completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let urlString = """
        https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m&current_weather=true&timezone=auto
        """
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherData.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
