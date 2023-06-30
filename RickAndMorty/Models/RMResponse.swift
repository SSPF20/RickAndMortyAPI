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
        let next: String?
        let prev: String?
    }
    
    let info: RMResponseInfo
    let results: [T]
}
