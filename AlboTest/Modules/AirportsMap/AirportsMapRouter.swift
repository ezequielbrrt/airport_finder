//
//  AirportsMapRouter.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation
import UIKit

class AirportsMapRouter: AirportsMapRouterProtocol {
    
    func showLoader() {
        AlertService.shared.showLoader()
    }
    
    func hideLoader() {
        AlertService.shared.hideLoader()
    }
    
    func showError() {
        AlertService.shared.showError()
    }

    class func createAirportsMapModule() -> UIViewController {
        let view = AirportsMapView()
        let presenter: AirportsMapPresenterProtocol & AirportsMapInteractorOutputProtocol = AirportsMapPresenter()
        let interactor: AirportsMapInteractorInputProtocol & AirportsMapRemoteDataManagerOutputProtocol = AirportsMapInteractor()
        let localDataManager: AirportsMapLocalDataManagerInputProtocol = AirportsMapLocalDataManager()
        let remoteDataManager: AirportsMapRemoteDataManagerInputProtocol = AirportsMapRemoteDataManager()
        let router: AirportsMapRouterProtocol = AirportsMapRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        router.view = view
        
        return view
    }
 
    weak var view: AirportsMapView?

}
