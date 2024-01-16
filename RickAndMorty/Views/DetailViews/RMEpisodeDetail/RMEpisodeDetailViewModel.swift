//
//  DetailEpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 14/10/23.
//

import Foundation

final class RMEpisodeDetailViewModel: RMItemCellViewModel {

    let episode: RMEpisode

    init(episode: RMEpisode) {
        self.episode = episode
        super.init(id: episode.id)
    }

    var name: String {
        return NSLocalizedString(episode.name, comment: "")
    }

    var created: String {
        return episode.created.formatted(date: .long, time: .shortened)
    }

    var airDate: String {
        return episode.airDate
    }
    
    var characters: [Int] {
        return episode.characters
    }

}
