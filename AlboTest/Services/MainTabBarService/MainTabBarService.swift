//
//  MainTabBarService.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//

import UIKit

final class MainTabBarService: NSObject {
    static var shared = MainTabBarService()

    func getTabBar(withSelectedOption option: MainTabBarOptions = .map) -> UITabBarController {
        mapItem = UINavigationController(rootViewController: AirportsMapRouter.createAirportsMapModule())
        listItem = UINavigationController(rootViewController: AirportsListRouter.createAirportsListModule())
        
        mapItem?.tabBarItem = UITabBarItem(title: "",
                                           image: UIImage(systemName: "mappin.circle")!
                                            .withRenderingMode(UIImage.RenderingMode.alwaysOriginal),
                                           selectedImage: UIImage(systemName: "mappin.circle.fill")!)
        
        listItem?.tabBarItem = UITabBarItem(title: "",
                                           image: UIImage(systemName: "list.dash")!
                                            .withRenderingMode(UIImage.RenderingMode.alwaysOriginal),
                                           selectedImage: UIImage(systemName: "list.dash")!)
        
        
     
        
        mapItem?.tabBarItem.imageInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        listItem?.tabBarItem.imageInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [mapItem!, listItem!]
        tabBar.delegate = self
        
        selectItem(onTabBar: tabBar, withOption: option)
        return tabBar
    }
    
    private func selectItem(onTabBar tabBar: UITabBarController, withOption option: MainTabBarOptions) {
        switch option {
        case .map: tabBar.selectedViewController = self.mapItem
        case .list: tabBar.selectedViewController = self.listItem
        }
    }
    
    private var mapItem: UINavigationController?
    private var listItem: UINavigationController?
    
    private override init() {
        super.init()
    }
}


extension MainTabBarService: UITabBarControllerDelegate {
    
}
