//
//  Character.swift
//  RickAndMortyIdk
//
//  Created by Simon on 25/05/23.
//

import Foundation
import UIKit

struct LocationBasic: Decodable {
    let name: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case url, name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let url = try container.decode(String.self, forKey: .url)
        name = try container.decode(String.self, forKey: .name)
        id = url.urlID ?? -1
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

struct RMCharacter: Decodable  {
    
    enum Gender: String, Decodable {
        case male = "Male"
        case female = "Female"
        case genderless
        case unknown
    }
    
    enum Status: String, Decodable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
        
        var string: String {
            switch self {
            case .alive, .dead:
                NSLocalizedString(self.rawValue, comment: "")
            case .unknown:
                NSLocalizedString("Unknown", comment: "")
            }
        }
    }
    
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let origin: LocationBasic
    let location: LocationBasic
    let image: String
    let episode: [String]
}

//extension RMCharacter: RMEntity {
//    static var reuseID: String {
//        "RMCharacterHorizontalCell"
//    }
//    
//    static var cellHorizontalType: RMItemCell.Type {
//        RMCharacterHorizontalCell.self
//    }
//    
//    func getViewModel() -> RMItemCellViewModel {
//        RMCharacterCellViewModel(character: self)
//    }
//    
//    static func endpointForPage(page: Int) -> RMEndpoint {
//        RMCharacterEndpoint.characterPage(page)
//    }
//}
