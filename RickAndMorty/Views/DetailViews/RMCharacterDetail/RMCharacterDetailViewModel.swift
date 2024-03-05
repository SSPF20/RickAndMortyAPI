//
//  RMCharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 11/08/23.
//

import Foundation

@Observable class RMCharacterDetailViewModel {
    
    let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    var name: String {
        character.name
    }
    
    var status: RMCharacter.Status {
        character.status
    }
    
    var species: String {
        character.species
    }
    
    var type: String {
        character.type
    }
    
    var gender: RMCharacter.Gender {
        character.gender
    }
    
    var origin: String {
        character.origin.name
    }
    
    var location: String {
        character.location.name
    }
    
    var imageURL: URL? {
        URL(string: character.image)
    }
    
    var characterIds: [Int] {
        character.episode
    }
}
