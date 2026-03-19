//
//  WetherModel.swift
//  WetherApp1
//
//  Created by bekarys abiev on 17.03.2026.
//
//
struct CurrentWeather: Codable{
    let name: String
    let main: MainWeather
    let weather: [WeatherInfo]
}


struct ForecastResponse: Codable {
    let list: [ForecastItem]
}

struct ForecastItem: Codable, Identifiable{
    let dt: Int
    let main: MainWeather
    let weather: [WeatherInfo]
    let dt_txt: String
    
    var id: Int {
        dt
    }
    
}



struct MainWeather: Codable{
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
}

struct WeatherInfo: Codable, Identifiable {
    let id: Int
    let main: String
    let description: String
    let icon: String

}
