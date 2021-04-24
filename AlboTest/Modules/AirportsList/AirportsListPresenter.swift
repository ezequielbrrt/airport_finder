//
//  AirportsListPresenter.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation

class AirportsListPresenter  {
    
    // MARK: Properties
    weak var view: AirportsListViewProtocol?
    var interactor: AirportsListInteractorInputProtocol?
    var router: AirportsListRouterProtocol?
    
    // MARK: Private
    private var airports: Airports?
}

extension AirportsListPresenter: AirportsListPresenterProtocol {
    func getAirportsCount() -> Int {
        return airports?.response.count ?? 0
    }
    
    func getAirport(withAiportIndex index: Int) -> Airport? {
        return (self.airports?.response[index]) ?? nil
    }
    
    func viewDidLoad() {
        guard let airports = AirportService.shared.airports else { return }
        self.airports = airports
        view?.showAirportsList(withAirports: airports)
    }
    
}

extension AirportsListPresenter: AirportsListInteractorOutputProtocol {

}
