//
//  MainFeature.swift
//  MySample
//
//  Created by 한승진 on 7/31/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainFeature {
    
    @ObservableState
    struct State: Equatable {
        var offset: Int = 0
        var notes: [NoteEntity] = []
    }
    
    enum Action {
        case loadNotes
        case nextPage
        case notesResponse([NoteEntity])
    }
    
    @Dependency(\.notes) var notesRepo
    
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadNotes:
                return .run { send in
                    let notes = try? await self.notesRepo.fetch()
                    await send(.notesResponse(notes ?? []))
                }
            case .nextPage:
                state.notes = []
                state.offset += 5
                return .run { [offset = state.offset] send in
                    let notes = try? await self.notesRepo.loadMore(offset)
                    await send(.notesResponse(notes ?? []))
                }
                
            case .notesResponse(let notes):
                state.notes = notes
                return .none
            }
        }
    }
}
