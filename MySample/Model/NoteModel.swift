//
//  NoteModel.swift
//  MySample
//
//  Created by 한승진 on 7/31/24.
//

import Foundation

struct NoteArrayBody: Codable {
    let notes: [Note]
}

struct Note: Codable, Equatable {
    let noteId: Int
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case noteId = "note_id"
        case content
    }
}
