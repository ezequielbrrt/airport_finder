//
//  AirportsListInteractor.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation

class AirportsListInteractor: AirportsListInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: AirportsListInteractorOutputProtocol?
    var localDatamanager: AirportsListLocalDataManagerInputProtocol?
    var remoteDatamanager: AirportsListRemoteDataManagerInputProtocol?

}

extension AirportsListInteractor: AirportsListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
