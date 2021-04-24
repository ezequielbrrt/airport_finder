//
//  AirportsMapInteractor.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation

class AirportsMapInteractor: AirportsMapInteractorInputProtocol {
    
    func getAirport(location: String, radius: String) {
        remoteDatamanager?.getAirport(location: location, radius: radius)
    }

    // MARK: Properties
    weak var presenter: AirportsMapInteractorOutputProtocol?
    var localDatamanager: AirportsMapLocalDataManagerInputProtocol?
    var remoteDatamanager: AirportsMapRemoteDataManagerInputProtocol?

}

extension AirportsMapInteractor: AirportsMapRemoteDataManagerOutputProtocol {
    func onGetAirportsError() {
        presenter?.onGetAirportsError()
    }
    
    func onGetAirports(withAirports airports: Airports) {
        presenter?.onGetAirports(withAirports: airports)
    }
}
