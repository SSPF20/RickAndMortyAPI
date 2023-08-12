//
//  RMEpisodeDetailsViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 1/08/23.
//

import Foundation

final class RMEpisodeDetailViewModel {
    
    private let  rmEpisode: RMEpisode
    
    init(rmEpisode: RMEpisode) {
        self.rmEpisode = rmEpisode
    }
    
    var name: String {
        rmEpisode.name
    }
    
    var airDate: String {
        rmEpisode.airDate
    }
    
    var episode: String {
        rmEpisode.episode
    }
}
