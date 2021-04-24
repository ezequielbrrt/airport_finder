//
//  AirportsListRouter.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation
import UIKit

class AirportsListRouter: AirportsListRouterProtocol {

    class func createAirportsListModule() -> UIViewController {
        
        let view = AirportsListView()
        let presenter: AirportsListPresenterProtocol & AirportsListInteractorOutputProtocol = AirportsListPresenter()
        let interactor: AirportsListInteractorInputProtocol & AirportsListRemoteDataManagerOutputProtocol = AirportsListInteractor()
        let localDataManager: AirportsListLocalDataManagerInputProtocol = AirportsListLocalDataManager()
        let remoteDataManager: AirportsListRemoteDataManagerInputProtocol = AirportsListRemoteDataManager()
        let router: AirportsListRouterProtocol = AirportsListRouter()
        
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
 
    weak var view: AirportsListView?

}
