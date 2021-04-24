//
//  SceneDelegateSetupConfiguration.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//

import Foundation
import UIKit

extension SceneDelegate {
    func setupWindow(windowScene: UIWindowScene) {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = InitialRouter.createInitialModule()
        
        if #available(iOS 13.0, *) { self.window?.overrideUserInterfaceStyle = .light }
    }
}
