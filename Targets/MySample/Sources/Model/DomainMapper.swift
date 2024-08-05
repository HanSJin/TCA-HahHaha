//
//  DomainMapper.swift
//  MySample
//
//  Created by 한승진 on 8/1/24.
//

import Foundation

protocol DomainMapper {
    associatedtype Dto
    associatedtype Entity
    
    func toEntity(from dto: Dto) -> Entity
 }
