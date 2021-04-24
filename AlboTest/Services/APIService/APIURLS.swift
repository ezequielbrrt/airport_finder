//
//  APIURLS.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 22/04/21.
//

import Foundation
struct APIURLS {
    static var shared: APIURLS = APIURLS()

    private let airportsURL = "https://api.aerisapi.com/places/airports/closest/?p="
    
    private let accessId = "xwIvjoujH9mLyhsDhJvaM"
    private let secretKey = "yc2ShVjolg5ebngpcnZ8suIehkGuSV6ZTR9dzqen"
    
    private init() {}
}

extension APIURLS {
    func generateURL(location: String, radius: String) -> URL {
        let urlString = airportsURL + location + "&limit=30&radius=" + radius + "km&filter=airport&client_id=" + accessId + "&client_secret=" + secretKey
        guard let url = URL(string: urlString) else {
            fatalError("Cannot create URL")
        }
        return url
    }
}
