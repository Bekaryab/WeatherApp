//
//  CurrentViewModel.swift
//  WetherApp1
//
//  Created by bekarys abiev on 17.03.2026.
//

import Foundation
import SwiftUI
import Combine
import UIKit
@MainActor
class CurrentViewModel: ObservableObject{
    @Published var isRainy: String = ""
    var cityName: String
    init(cityName: String){
        let savedData = UserDefaults.standard.string(forKey: "lastCity")
        self.cityName = savedData ?? "Almaty"
        
        Task{
            await fetchWeather()
            await forecastItem()
        }
    }
    @Published var weather: CurrentWeather?
    @Published var forecast: [ForecastItem] = []
    private let service = WetherApi()
    func fetchWeather() async{
        do{
            let res = try await service.getWether(nameCity: cityName)
            weather = res
            self.weather = res
            if let mainStatus = res.weather.first?.main {
                self.isRainy = mainStatus.lowercased()
            }
        }catch{
            print("error: \(error.localizedDescription)")
        }
        
        
    }
    func forecastItem() async {
        do{
            let res = try await service.getForecast(nameCity: cityName)
            forecast = res
        }catch {
            print("error: \(error.localizedDescription)")
        }
    }
    func dayName(from dt: Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }
    var dailyForecast: [ForecastItem] {
        forecast.filter { $0.dt_txt.contains("12:00:00") }
    }
}

