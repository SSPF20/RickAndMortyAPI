//
//  RMEpisodeCellViewModel.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 11/07/23.
//

import Foundation

class RMEpisodeCellViewModel: RMItemCellViewModel {
    
    let episode: RMEpisode
    
    init(episode: RMEpisode) {
        self.episode = episode
        super.init(id: episode.id)
    }
    
    var name: String {
        return episode.name
    }
    
    var air_Date: String {
        return episode.air_date
    }
    
    var created: String {
        return episode.created
    }
    
}
