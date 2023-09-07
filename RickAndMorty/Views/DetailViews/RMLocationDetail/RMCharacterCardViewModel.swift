//
//  CharacterCardViewModel2.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 6/09/23.
//

import Foundation
import Observation
import SwiftUI

@Observable
final class RMCharacterCardViewModel {
    
    var id: Int
    var character: RMCharacter?
    var networkFetcher: NetworkFetcher
    
    init(id: Int, networkFetcher: NetworkFetcher = DefaultNetworkFetcher()) {
        self.id = id
        self.networkFetcher = networkFetcher
        loadCharacter()
    }
    
    func loadCharacter () {
        Task { @MainActor in
            do {
                let endpoint = RMCharacterEndpoint.characterById(id)
                let character: RMCharacter = try await networkFetcher.fetch(endpoint: endpoint)
                self.character = character
            } catch {
                assert(false, String(describing: error))
            }
        }
    }
    
    var name: String {
        character?.name ?? "error"
    }
    
    var imageURL: URL? {
        URL(string: character?.image ?? "")
    }
    
}
