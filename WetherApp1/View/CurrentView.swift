//
//  CurrentView.swift
//  WetherApp1
//
//  Created by bekarys abiev on 17.03.2026.
//

import Foundation
import SwiftUI
import Combine
struct CurrentView: View {
    @ObservedObject var viewModel: CurrentViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            ScrollView{
                if let weather = viewModel.weather {
                    
                    
                    Text("\(weather.name)")
                        .padding(.top, 20)
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    Text("\(Int(weather.main.temp))°")
                        .font(.system(size: 90))
                        .foregroundColor(.white)
                    Text(weather.weather.first?.description.capitalized ?? "")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.8))
                    
                    LazyVGrid(columns: columns){
                        DayForecast(day: "Today", isRainy: weather.weather.first?.main ?? "", high: Int(weather.main.temp_max), low: Int(weather.main.temp_min))
                        ForEach(viewModel.dailyForecast){ item in
                            DayForecast(day: viewModel.dayName(from: item.dt),
                                        isRainy: item.weather.first?.main ?? "",
                                        high: Int(item.main.temp),
                                        low: Int(item.main.temp_min))
                            
                        }
                        
                    }
                    .padding(.top, 60)
                    Spacer()
                } else {
                    ProgressView()
                        .tint(.white)
                }
            }
        }
        .task {
            await viewModel.fetchWeather()
            await viewModel.forecastItem()
        }
    }
}

struct DayForecast: View {
    let day: String
    let isRainy: String
    let high: Int
    let low: Int
    
    var iconName: String {
        switch isRainy.lowercased() {
        case "clouds": return "cloud.fill"
        case "clear": return "sun.max.fill"
        case "rain", "drizzle": return "cloud.rain.fill"
        case "thunderstorm": return "cloud.bolt.rain.fill"
        case "snow": return "snowflake"
        case "mist", "smoke", "haze", "fog": return "cloud.fog.fill"
        default: return "sun.max"
        }
    }

    var iconColor: Color {
        switch isRainy.lowercased() {
        case "clouds": return Color.gray
        case "clear": return Color.yellow
        case "rain", "drizzle", "thunderstorm": return Color.yellow
        case "snow": return Color.white
        case "mist", "smoke", "haze", "fog": return Color.white.opacity(0.8)
        default: return Color.white
        }
    }
    
    var body: some View {
            VStack {
                Text(day)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Image(systemName: iconName)
                    .foregroundStyle(iconColor)
                    .font(.largeTitle)
                    .padding(5)
                
                Text("High: \(high)°")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Text("Low: \(low)°")
                    .fontWeight(.medium)
                    .foregroundStyle(.white.opacity(0.7))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 170)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.15))
            )
            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
        }
}
