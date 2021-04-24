//
//  AirportsMapProtocols.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation
import UIKit

protocol AirportsMapViewProtocol: class {
    func askForLocalizationPermission()
    func showAirports(withAirports airports: Airports)

    // PRESENTER -> VIEW
    var presenter: AirportsMapPresenterProtocol? { get set }
}

protocol AirportsMapRouterProtocol: class {
    func showLoader()
    func hideLoader()
    func showError()
    
    // PRESENTER -> ROUTER
    static func createAirportsMapModule() -> UIViewController
    var view: AirportsMapView? { get set }
}

protocol AirportsMapPresenterProtocol: class {
    func localizationObtained(latitud: Double, longitud: Double)
    
    // VIEW -> PRESENTER
    var view: AirportsMapViewProtocol? { get set }
    var interactor: AirportsMapInteractorInputProtocol? { get set }
    var router: AirportsMapRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol AirportsMapInteractorOutputProtocol: class {
    func onGetAirports(withAirports airports: Airports)
    func onGetAirportsError()
    
// INTERACTOR -> PRESENTER
}

protocol AirportsMapInteractorInputProtocol: class {
    func getAirport(location: String, radius: String)
    
    // PRESENTER -> INTERACTOR
    var presenter: AirportsMapInteractorOutputProtocol? { get set }
    var localDatamanager: AirportsMapLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: AirportsMapRemoteDataManagerInputProtocol? { get set }
}

protocol AirportsMapDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol AirportsMapRemoteDataManagerInputProtocol: class {
    func getAirport(location: String, radius: String)
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: AirportsMapRemoteDataManagerOutputProtocol? { get set }
}

protocol AirportsMapRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onGetAirports(withAirports airports: Airports)
    func onGetAirportsError()
}

protocol AirportsMapLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
