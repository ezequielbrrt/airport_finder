//
//  AirportService.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 22/04/21.
//

import Foundation

class AirportService {
    static var shared: AirportService = AirportService()
    
    var airports: Airports?
    
    private init() {}
}
