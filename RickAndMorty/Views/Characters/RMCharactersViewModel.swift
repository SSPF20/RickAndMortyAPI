//
//  RMCharactersViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 10/06/23.
//

import Foundation

final class RMCharactersViewModel {
    
    let dataProvider: RMDataProvider<RMCharacter, RMCharacterConfiguration>
    var characters: [[RMCharacter]] = []
    
    init(dataProvider: RMDataProvider<RMCharacter, RMCharacterConfiguration> = RMDataProvider<RMCharacter, RMCharacterConfiguration>(entity: RMEntity<RMCharacter, RMCharacterConfiguration>(configuration: RMCharacterConfiguration()))) {
        self.dataProvider = dataProvider
    }
    
    func start() {
        Task {
            do {
                let response = try await dataProvider.getPage(page: 1)
                self.characters.append(response.results)
            } catch {
                print("ERror loading first page \(String(describing: error))")
            }
        }
    }
}
