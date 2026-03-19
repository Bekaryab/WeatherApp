//
//  SearchView.swift
//  WetherApp1
//
//  Created by bekarys abiev on 18.03.2026.
//

import Foundation
import SwiftUI
import Combine
struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    @ObservedObject var currentViewModel: CurrentViewModel
    @State private var searchText: String = ""
    @EnvironmentObject var router: AppRouter
    var body: some View{
        
            NavigationStack{
                ZStack{
                    Color.blue.ignoresSafeArea()
                    List {
                        if let weather = viewModel.weather {
                            
                            Button(action: {
                                currentViewModel.cityName = searchText
                                router.selectedTab = 0
                                UserDefaults.standard.set(searchText, forKey: "lastCity")
                                Task{
                                    await currentViewModel.fetchWeather()
                                    await currentViewModel.forecastItem()
                                }
                            }){
                                HStack {
                                    Text(weather.name)
                                    Spacer()
                                    Text("\(Int(weather.main.temp))°C")
                                }
                                    .foregroundColor(.black)
                                    
                            }
                            .listRowBackground(Color.white.opacity(0.15))

                        }
                    }
                    
                    .scrollContentBackground(.hidden)
                    
                        .searchable(text: $searchText)
                        .onChange (of: searchText){ newValue in
                            Task{
                                await viewModel.serachFunc(searchText: newValue)
                            }
                        }
                                            
                    
                }
            }
        
    }
}
