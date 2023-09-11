//
//  Location.swift
//  RickAndMortyIdk
//
//  Created by Simon on 2/06/23.
//

import Foundation

struct RMLocation: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    @IntegerArrayExtractor var residents: [Int]
}
