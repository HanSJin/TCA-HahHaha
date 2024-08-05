//
//  NetworkConfig.swift
//  MySample
//
//  Created by 한승진 on 8/1/24.
//

import Foundation

// Hello, I'm mini networker :)

struct NetworkConfig {
    
    enum Domain: String {
        case firstParty = "http://localhost:3000"
    }
    enum Path: String {
        case note
    }
    typealias Query = Dictionary<String, Any>
    
    static func endPoint(domain: Domain = .firstParty, path: Path, query: Query = [:]) -> URL {
        var query = query
        query["author_uuid"] = Bundle.main.apiKey
        return URL(string: domain.rawValue + "/" + path.rawValue + "?" + (query.queryString ?? ""))!
    }
}

fileprivate extension Dictionary {
    
    var queryString: String? {
        return self.reduce("") { "\($0!)\($1.0)=\($1.1)&" }
    }
}
