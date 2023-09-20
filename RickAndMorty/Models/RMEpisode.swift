//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 11/07/23.
//

import Foundation

struct RMEpisode: Decodable {
    var id: Int
    var name: String
    var airDate: String
    var episode: String
    @IntegerArrayExtractor var characters: [Int]
    var url: String
    var created: Date
    
    enum CodingKeys: String, CodingKey {
        case characters,id,name,airDate = "air_date",episode, url, created
    }
    
}



