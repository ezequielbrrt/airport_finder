//
//  AirportsMapPresenter.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation

class AirportsMapPresenter  {
    
    // MARK: Properties
    weak var view: AirportsMapViewProtocol?
    var interactor: AirportsMapInteractorInputProtocol?
    var router: AirportsMapRouterProtocol?
}

extension AirportsMapPresenter: AirportsMapPresenterProtocol {
    func viewDidLoad() {
        view?.askForLocalizationPermission()
    }
    
    func localizationObtained(latitud: Double, longitud: Double) {
        router?.showLoader()
        let location = "\(latitud),\(longitud)"
        interactor?.getAirport(location: location, radius: "\(RadiusService.shared.radius)")
    }
}

extension AirportsMapPresenter: AirportsMapInteractorOutputProtocol {
    func onGetAirportsError() {
        router?.hideLoader()
        router?.showError()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.router?.hideLoader()
        }
    }
    
    func onGetAirports(withAirports airports: Airports) {
        router?.hideLoader()
        AirportService.shared.airports = airports
        view?.showAirports(withAirports: airports)
    }
}
