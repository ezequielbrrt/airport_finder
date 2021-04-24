//
//  Airports.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 22/04/21.
//

import Foundation

// MARK: - Airports
struct Airports: Codable {
    let success: Bool
    let response: [Airport]
}

// MARK: - Response
struct Airport: Codable {
    let id: String
    let loc: LOC
    let place: Place
    let profile: Profile
    let relativeTo: RelativeTo
}

// MARK: - LOC
struct LOC: Codable {
    let lat, long: Double
}

// MARK: - Place
struct Place: Codable {
    let name, city, state, stateFull: String
    let country, countryFull, region, regionFull: String
    let continent, continentFull: String
    
    func getAddress() -> String {
        var addressValues: [String] = []
        if !city.isEmpty { addressValues.append(city) }
        if !countryFull.isEmpty { addressValues.append(countryFull) }
        if !continentFull.isEmpty { addressValues.append(continentFull) }
        return addressValues.joined(separator: ", ")
    }
    
}

// MARK: - Profile
struct Profile: Codable {
    let id, local, type: String
    let typeENG: String
}

// MARK: - RelativeTo
struct RelativeTo: Codable {
    let lat, long: Double
    let bearing: Int
    let bearingENG: String
    let distanceKM, distanceMI: Double
    
    func getDistanceKM() -> String {
        return "\(lround(distanceKM))km"
    }
    
}
