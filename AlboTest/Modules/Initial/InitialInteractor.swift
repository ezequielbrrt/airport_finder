//
//  InitialInteractor.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation

class InitialInteractor: InitialInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: InitialInteractorOutputProtocol?
    var localDatamanager: InitialLocalDataManagerInputProtocol?
    var remoteDatamanager: InitialRemoteDataManagerInputProtocol?

}

extension InitialInteractor: InitialRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
