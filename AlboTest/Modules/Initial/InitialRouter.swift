//
//  InitialRouter.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation
import UIKit

class InitialRouter: InitialRouterProtocol {
    
    func showTabBarMenu() {
        let module = MainTabBarService.shared.getTabBar()
        guard let window = self.view?.view.window else { return }
        
        UIWindow.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.rootViewController?.dismiss(animated: false, completion: nil)
            window.rootViewController = module
          }, completion: nil)
    }

    class func createInitialModule() -> UIViewController {
        let view = InitialView()
        let presenter: InitialPresenterProtocol & InitialInteractorOutputProtocol = InitialPresenter()
        let interactor: InitialInteractorInputProtocol & InitialRemoteDataManagerOutputProtocol = InitialInteractor()
        let localDataManager: InitialLocalDataManagerInputProtocol = InitialLocalDataManager()
        let remoteDataManager: InitialRemoteDataManagerInputProtocol = InitialRemoteDataManager()
        let router: InitialRouterProtocol = InitialRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        router.view = view
        
        let navController = UINavigationController()
        navController.viewControllers.append(view)
        
        return navController
    }
    
    weak var view: InitialView?
    
}
