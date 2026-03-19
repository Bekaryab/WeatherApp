//
//  MainTabView.swift
//  WetherApp1
//
//  Created by bekarys abiev on 18.03.2026.
//

import Foundation
import SwiftUI
struct MainTabView: View {
    @StateObject private var currentViewModel = CurrentViewModel(cityName: "Almaty")
    @StateObject private var serachViewModel = SearchViewModel()
    @EnvironmentObject var router: AppRouter
    var body: some View {
        TabView(selection: $router.selectedTab){
            CurrentView(viewModel: currentViewModel)
                .tabItem{
                    Label("Current", systemImage: "sun.max")
                }
                .tag(0)
            SearchView(viewModel: serachViewModel, currentViewModel: currentViewModel)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
        }
    }
}
