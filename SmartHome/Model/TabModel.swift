//
//  Tab.swift
//  SmartHome
//
//  Created by Eze Chidera Paschal on 17/09/2024.
//

import Foundation


enum TabModel: String, CaseIterable {
    case home = "house.fill"
    case search = "magnifyingglass"
    case safety = "lock.shield"
    case settings = "gearshape.fill"
    
    var title: String {
        switch self {
        case .home:
            "Home"
        case .search:
            "Devices"
        case .safety:
            "Safety"
        case .settings:
            "Settings"
        }
    }
}
