//
//  NoteService.swift
//  MySample
//
//  Created by 한승진 on 7/31/24.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

protocol APIClientType {
    func request<T: Codable>(url: URL) async throws -> T
}

struct APIClient {
    static let shared = APIClient()
}

extension APIClient: APIClientType {
    
    func request<T: Codable>(url: URL) async throws -> T {
        let request = try URLRequest(url: url, method: .get)
        let response: BaseModel<T> = try await URLSession.shared.asyncData(for: request)
        return response.body
    }
}

extension URLSession {
    
    typealias DataResponse = (Data, URLResponse)
    
    public func asyncData<T: Decodable>(for urlRequest: URLRequest) async throws -> T {
        let dataResponse: DataResponse = try await URLSession.shared.data(for: urlRequest)
        return try JSONDecoder().decode(T.self, from: dataResponse.0)
    }
}
