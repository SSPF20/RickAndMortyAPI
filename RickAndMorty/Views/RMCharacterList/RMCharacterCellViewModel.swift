//
//  RMCharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 10/07/23.
//

import Foundation

final class RMCharacterCellViewModel: RMItemCellViewModel {
    
    let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
        super.init(id: character.id)
    }
    
    var imageURL: URL? {
        URL(string: character.image)
    }
    
    var specie: String {
        character.species
    }
    
    var name: String? {
        character.name
    }
    
    var status: RMCharacter.Status {
        character.status
    }
    
    var location: String? {
        character.location.name
    }
}
