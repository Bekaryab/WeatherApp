//
//  SearchViewModel.swift
//  WetherApp1
//
//  Created by bekarys abiev on 18.03.2026.
//

import Foundation
import SwiftUI
import Combine
import UIKit
@MainActor
class SearchViewModel: ObservableObject{
    @Published var weather: CurrentWeather?
    @Published var forecast: [ForecastItem] = []
    
    private var service = WetherApi()
    func serachFunc(searchText: String) async {
        do {
            let res = try await service.getWether(nameCity: searchText)
            let res1 = try await service.getForecast(nameCity: searchText)
            weather = res
            forecast = res1
        }catch {
            print("error: \(error.localizedDescription)")
        }
    }
}
