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
    var characterIds: [Int]
    var url: String
    var created: Date
    
    enum CodingKeys: String, CodingKey {
        case characters,id,name,airDate = "air_date",episode, url, created
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let urlFromChar = try container.decode([String].self, forKey: CodingKeys.characters)
        
        id = try container.decode(Int.self, forKey: CodingKeys.id)
        name = try container.decode(String.self, forKey: CodingKeys.name)
        airDate = try container.decode(String.self, forKey: CodingKeys.airDate)
        episode = try container.decode(String.self, forKey: CodingKeys.episode)
        url = try container.decode(String.self, forKey: CodingKeys.url)
        created = try container.decode(Date.self, forKey: CodingKeys.created)
        let ids = urlFromChar.compactMap({ $0.urlID ?? -1 })
        characterIds = ids
    }
    
    init(id: Int, name: String, airDate: String, episode: String, characterIds: [Int], url: String, created: Date) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characterIds = characterIds
        self.url = url
        self.created = created
    }
}



