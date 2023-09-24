//
//  RMResponse.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 10/06/23.
//

import Foundation

struct RMResponse<T: Decodable>: Decodable {
    struct RMResponseInfo: Decodable {
        let count: Int
        let pages: Int
        @OptionalIntegerExtractor var next: Int?
        @OptionalIntegerExtractor var prev: Int?
    }
    
    let info: RMResponseInfo
    let results: [T]
}
