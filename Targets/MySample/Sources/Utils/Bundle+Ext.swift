//
//  Bundle.swift
//  MySample
//
//  Created by 한승진 on 8/1/24.
//

import Foundation

extension Bundle {
    
    var apiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            assertionFailure("API KEY not found")
            return ""
        }
        return key
    }
}
