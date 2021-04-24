//
//  InitialPresenter.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation

class InitialPresenter  {
    
    // MARK: Properties
    weak var view: InitialViewProtocol?
    var interactor: InitialInteractorInputProtocol?
    var router: InitialRouterProtocol?
}

extension InitialPresenter: InitialPresenterProtocol {
    func viewDidLoad() {
        view?.showInformation(withValue: "0", isButtonEnable: false)
    }
    
    func userSlideRadius(withValue value: Float) {
        let intValue = lround(Double(value))
        RadiusService.shared.radius = intValue
        view?.showInformation(withValue: "\(intValue)", isButtonEnable: intValue > 0)
    }
    
    func userTapOnSearch() {
        router?.showTabBarMenu()
    }
}

extension InitialPresenter: InitialInteractorOutputProtocol {

}
