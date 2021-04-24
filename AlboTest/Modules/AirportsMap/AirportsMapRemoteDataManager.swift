//
//  AirportsMapRemoteDataManager.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation

class AirportsMapRemoteDataManager:AirportsMapRemoteDataManagerInputProtocol {
    
    func getAirport(location: String, radius: String) {
        let url = APIURLS.shared.generateURL(location: location, radius: radius)
        let task = URLSession.shared.dataTask(with: url) {  data, response, error in
            DispatchQueue.main.async { [weak self] in
                guard let data = data else {
                    self?.remoteRequestHandler?.onGetAirportsError()
                    return
                }
                
                do {
                    let airports = try JSONDecoder().decode(Airports.self, from: data)
                    airports.success ? self?.remoteRequestHandler?.onGetAirports(withAirports: airports) : self?.remoteRequestHandler?.onGetAirportsError()
                } catch  {
                    self?.remoteRequestHandler?.onGetAirportsError()
                    return
                }
            }
        }

        task.resume()
        
    }
    
    var remoteRequestHandler: AirportsMapRemoteDataManagerOutputProtocol?
    
}
