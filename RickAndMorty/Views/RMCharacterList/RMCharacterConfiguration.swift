//
//  RMCharacterConfiguration.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 10/07/23.
//

import Foundation

struct RMCharacterConfiguration: Configuration {
    
    var cellHorizontalType: RMItemCell.Type {
        RMCharacterHorizontalCell.self
    }
    
    var reuseID: String {
        "RMCharacterHorizontalCell"
    }
    
    func endpointForPage(page: Int) -> RMEndpoint {
        RMCharacterEndpoint.characterPage(page)
    }
    
    func getCellViewModelForEntity<T: Decodable>(entity: T) -> RMItemCellViewModel? {
        guard let rmCharacter = entity as? RMCharacter else {
            return nil
        }
        
        let viewModel = RMCharacterCellViewModel(character: rmCharacter)
        return viewModel
    }
}
