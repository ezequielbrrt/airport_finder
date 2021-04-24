//
//  MainTabBarOptions.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//

import UIKit

enum MainTabBarOptions {
    case map
    case list
    
    static func getOnSelectedIndex(index: Int) -> MainTabBarOptions {
        switch index {
        case 0: return .map
        case 1: return .list
        default: return .map
        }
    }
}
