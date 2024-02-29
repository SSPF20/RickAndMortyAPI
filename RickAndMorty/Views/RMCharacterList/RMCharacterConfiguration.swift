//
//  RMCharacterConfiguration.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 10/07/23.
//

import Foundation

struct RMCharacterConfiguration: UniversalConfiguration {
    
    func endpointForPage(page: Int) -> RMEndpoint {
        RMCharacterEndpoint.characterPage(page)
    }
}
