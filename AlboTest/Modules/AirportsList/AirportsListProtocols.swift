//
//  AirportsListProtocols.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation
import UIKit

protocol AirportsListViewProtocol: class {
    func showAirportsList(withAirports airports: Airports)
    
    // PRESENTER -> VIEW
    var presenter: AirportsListPresenterProtocol? { get set }
}

protocol AirportsListRouterProtocol: class {
    // PRESENTER -> ROUTER
    static func createAirportsListModule() -> UIViewController
    var view: AirportsListView? { get set }

}

protocol AirportsListPresenterProtocol: class {
    func getAirportsCount() -> Int
    func getAirport(withAiportIndex index: Int) -> Airport?
    
    // VIEW -> PRESENTER
    var view: AirportsListViewProtocol? { get set }
    var interactor: AirportsListInteractorInputProtocol? { get set }
    var router: AirportsListRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol AirportsListInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol AirportsListInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: AirportsListInteractorOutputProtocol? { get set }
    var localDatamanager: AirportsListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: AirportsListRemoteDataManagerInputProtocol? { get set }
}

protocol AirportsListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol AirportsListRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: AirportsListRemoteDataManagerOutputProtocol? { get set }
}

protocol AirportsListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol AirportsListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
