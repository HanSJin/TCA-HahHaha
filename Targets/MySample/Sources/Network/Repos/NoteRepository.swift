//
//  NoteRepository.swift
//  MySample
//
//  Created by 한승진 on 7/31/24.
//

import Foundation
import ComposableArchitecture

struct NoteRepository {
    
    var fetch: () async throws -> [NoteEntity]
    var loadMore: (Int) async throws -> [NoteEntity]
}

extension NoteRepository: DependencyKey {
    
    static let noteMapper = NoteDomainMapper()
    
    static let liveValue = Self(
        fetch: {
            let url = NetworkConfig.endPoint(path: .note, query: ["limit": 5, "offset": 0])
            let result: NoteArrayDto = try await APIClient.shared.request(url: url)
            return result.notes.map { noteMapper.toEntity(from: $0) }
        },
        loadMore: { offset in
            let url = NetworkConfig.endPoint(path: .note, query: ["limit": 5, "offset": offset])
            let result: NoteArrayDto = try await APIClient.shared.request(url: url)
            return result.notes.map { noteMapper.toEntity(from: $0) }
        }
    )
}

extension DependencyValues {
    
    var notes: NoteRepository {
        get { self[NoteRepository.self] }
        set { self[NoteRepository.self] = newValue }
    }
}
