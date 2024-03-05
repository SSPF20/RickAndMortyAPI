//
//  RMEpisodeConfiguration.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 11/07/23.
//

import Foundation


struct RMEpisodeConfiguration: ConfigurationForEntity {
    
    var estimatedHeightForItem: CGFloat {
        return  100.0

    }
    
    
    var cellHorizontalType: RMItemCell.Type {
        RMEpisodeHorizontalCell.self
    }
    
    func endpointForPage(page: Int) -> RMEndpoint {
        RMEpisodeEndpoint.episodePage(page)
    }
    
    var reuseID: String {
        "RMEpisodeHorizontalCell"
    }
    
    func getCellViewModelForEntity<T>(entity: T) -> RMItemCellViewModel? where T : Decodable {
        guard let RMEpisode = entity as? RMEpisode else {
            return nil
        }
        let viewModel = RMEpisodeCellViewModel(episode: RMEpisode)
        return viewModel
    }
    
    func getClickableAction<T>(for entity: T) -> ClickableAction? where T : Decodable {
        
        guard let episode = entity as? RMEpisode else {
            return nil
        }
        let viewModel = RMEpisodeDetailViewModel(episode: episode)
        let view = RMEpisodeDetailView(viewModel: viewModel)
        let viewController = RMHostingController(view: view)
        return .pushVC(viewController)
    }
}
