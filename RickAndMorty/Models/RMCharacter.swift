//
//  Character.swift
//  RickAndMortyIdk
//
//  Created by Simon on 25/05/23.
//

import Foundation
import UIKit
import SwiftUI

struct LocationBasic: Decodable {
    
    @OptionalIntegerExtractor var id: Int?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case name
    }
}

struct RMCharacter: Decodable, Hashable  {
    
    enum Gender: String, Decodable {
        case male = "Male"
        case female = "Female"
        case genderless = "Genderless"
        case unknown
        
        var imageColor: Color {
            switch self {
                
            case .male:
                return .blue
            case .female:
                return .purple
            case .genderless:
                return .red
            case .unknown:
                return .gray
            }
        }
        
        var imageName: String {
            switch self {
                
            case .male:
                return "maleGender"
            case .female:
                return "femaleGender"
            case .genderless:
                return "transGender"
            case .unknown:
                return "question-mark"
            }
        }
    }
    
    enum Status: String, Decodable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown         
        var string: String {
            switch self {
            case .alive, .dead:
                NSLocalizedString(self.rawValue, comment: "")
            case .unknown:
                NSLocalizedString("Unknown", comment: "")
            }
        }
        
        var color: Color {
            switch self {
            case .alive:
                return .green
            case .dead:
                return .red
            case .unknown:
                return .gray
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
    @IntegerArrayExtractor var episode: [Int]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RMCharacter, rhs: RMCharacter) -> Bool {
        lhs.id == rhs.id
    }
}
