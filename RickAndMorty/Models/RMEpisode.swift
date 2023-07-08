//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 7/07/23.
//

import Foundation

struct RMEpisode: Decodable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
}
