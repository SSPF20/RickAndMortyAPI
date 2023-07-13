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
    var air_date: String
    var episode: String
    var characterIds: [Int]
    var url: String
    var created: Date
    
    enum CodingKeys: String, CodingKey {
        case characters,id,name,air_date,episode, url, created
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let urlFromChar = try container.decode([String].self, forKey: CodingKeys.characters)
        id = try container.decode(Int.self, forKey: CodingKeys.id)
        name = try container.decode(String.self, forKey: CodingKeys.name)
        air_date = try container.decode(String.self, forKey: CodingKeys.air_date)
        episode = try container.decode(String.self, forKey: CodingKeys.episode)
        url = try container.decode(String.self, forKey: CodingKeys.url)
        created = try container.decode(Date.self, forKey: CodingKeys.created)
        let ids = urlFromChar.map({ (urlGet) in
            return urlGet.urlID ?? -1
        })
        characterIds = ids
    }
    init(id: Int, name: String, air_date: String, episode: String, characterIds: [Int], url: String, created: Date) {
        self.id = id
        self.name = name
        self.air_date = air_date
        self.episode = episode
        self.characterIds = characterIds
        self.url = url
        self.created = created
    }
}



