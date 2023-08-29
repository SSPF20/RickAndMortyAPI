//
//  EpisodeCardViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 25/08/23.
//

import Foundation
import Observation

@Observable
final class EpisodeCardViewModel {
    
    private var rmEpisode: RMEpisode?
    private let id: Int
    private let networkFetcher: NetworkFetcher
    
    init(id: Int, networkFetcher: NetworkFetcher = DefaultNetworkFetcher()) {
        self.id = id
        self.networkFetcher = networkFetcher
        loadEpisode()
    }
    
    var name: String = ""
    
    var airDate: String {
        rmEpisode?.airDate ?? ""
    }
    
    var episode: String {
        rmEpisode?.episode ?? ""
    }
    
    func loadEpisode() {
        Task { @MainActor in
            do {
                let endpoint = RMEpisodeEndpoint.episodeById(id)
                let rmepisode: RMEpisode = try await networkFetcher.fetch(endpoint: endpoint)
                self.rmEpisode = rmepisode
                self.name = rmepisode.name
            } catch {
                print(String(describing: error))
            }
        }
    }
    

}
