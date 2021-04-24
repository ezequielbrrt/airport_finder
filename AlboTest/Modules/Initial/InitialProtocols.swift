//
//  InitialProtocols.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation
import UIKit

protocol InitialViewProtocol: class {
    func showInformation(withValue value: String, isButtonEnable: Bool)
    
    var presenter: InitialPresenterProtocol? { get set }
}

protocol InitialRouterProtocol: class {
    func showTabBarMenu()
    
    // PRESENTER -> ROUTER
    static func createInitialModule() -> UIViewController
    var view: InitialView? { get set }
}

protocol InitialPresenterProtocol: class {
    func userSlideRadius(withValue value: Float)
    func userTapOnSearch()
    
    // VIEW -> PRESENTER
    var view: InitialViewProtocol? { get set }
    var interactor: InitialInteractorInputProtocol? { get set }
    var router: InitialRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol InitialInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol InitialInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: InitialInteractorOutputProtocol? { get set }
    var localDatamanager: InitialLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: InitialRemoteDataManagerInputProtocol? { get set }
}

protocol InitialDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol InitialRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: InitialRemoteDataManagerOutputProtocol? { get set }
}

protocol InitialRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol InitialLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
