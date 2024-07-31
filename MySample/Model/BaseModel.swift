//
//  BaseModel.swift
//  MySample
//
//  Created by 한승진 on 7/31/24.
//

import Foundation

protocol BaseModelable: Codable {
    associatedtype BodyModel
    var code: Int { get set }
    var body: BodyModel { get set }
    var message: String { get set }
}

enum BaseModelCodingKeys: String, CodingKey {
    case code, body, message
}

struct BaseModel<T: Codable>: BaseModelable {
    typealias BodyModel = T
    
    var code: Int
    var message: String
    var body: T
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: BaseModelCodingKeys.self)
        code = try values.decode(Int.self, forKey: .code)
        message = try values.decode(String.self, forKey: .message)
        body = try values.decode(T.self, forKey: .body)
    }
}
