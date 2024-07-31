//
//  NoteRepository.swift
//  MySample
//
//  Created by 한승진 on 7/31/24.
//

import Foundation
import ComposableArchitecture

struct NoteRepository {
    var fetch: () async throws -> [Note]
    var loadMore: (Int) async throws -> [Note]
}

extension NoteRepository: DependencyKey {
    static let path = "http://localhost:3000/note?author_uuid=F234B94F-0B1A-49E6-A07F-BD23AB4CDF20"
    
    static let liveValue = Self(
        fetch: {
            let url = URL(string: "\(NoteRepository.path)&limit=5&offset=\(0)")!
            let result: NoteArrayBody = try await APIClient.shared.request(url: url)
            return result.notes
        },
        loadMore: { offset in
            let url = URL(string: "\(NoteRepository.path)&limit=5&offset=\(offset)")!
            let result: NoteArrayBody = try await APIClient.shared.request(url: url)
            return result.notes
        }
    )
}

extension DependencyValues {
    
    var notes: NoteRepository {
        get { self[NoteRepository.self] }
        set { self[NoteRepository.self] = newValue }
    }
}
