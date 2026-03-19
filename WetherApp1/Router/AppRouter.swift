//
//  AppRouter.swift
//  WetherApp1
//
//  Created by bekarys abiev on 17.03.2026.
//

import Foundation
import SwiftUI
import UIKit
import Combine
class AppRouter: ObservableObject{
    @Published var selectedTab: Int = 0
    
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func currentPage(){
        let view = MainTabView().environmentObject(self)
        let vc = UIHostingController(rootView: view)
        navigationController.setViewControllers([vc], animated: false)
    }
    
}
