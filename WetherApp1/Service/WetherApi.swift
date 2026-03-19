//
//  WetherApi.swift
//  WetherApp1
//
//  Created by bekarys abiev on 17.03.2026.
//
//

//
//
//  WetherApi.swift
//  WetherApp1
//
//  Created by bekarys abiev on 17.03.2026.
//

import Foundation
import SwiftUI
import Combine
import UIKit

class WetherApi {
    
    private var apiKey: String {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let key = dict["WeatherAPIKey"] as? String else {
            fatalError("Config.plist табылмады!")
        }
        return key
    }
    
    func getWether(nameCity: String) async throws -> CurrentWeather {
        guard let urlString = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(nameCity)&appid=\(apiKey)&units=metric") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: urlString)
        let decoder = JSONDecoder()
        let result = try decoder.decode(CurrentWeather.self, from: data)
        return result
    }
    
    func getForecast(nameCity: String) async throws -> [ForecastItem] {
        guard let urlString = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(nameCity)&appid=\(apiKey)&units=metric") else {
            return []
        }
        print("url reqeusted : \(urlString)")
        let (data, _) = try await URLSession.shared.data(from: urlString)
        let decoder = JSONDecoder()
        let result = try decoder.decode(ForecastResponse.self, from: data)
        return result.list
    }
}
