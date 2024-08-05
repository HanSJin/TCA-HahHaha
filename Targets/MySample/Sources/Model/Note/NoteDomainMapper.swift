//
//  NoteDomainMapper.swift
//  MySample
//
//  Created by 한승진 on 8/1/24.
//

import Foundation

struct NoteDomainMapper: DomainMapper {
    typealias Dto = NoteDto
    typealias Entity = NoteEntity
    
    func toEntity(from dto: NoteDto) -> NoteEntity {
        .init(
            noteId: dto.noteId,
            content: dto.content
        )
    }
}
