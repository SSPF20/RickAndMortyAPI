//
//  RMLocationConfiguration.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 10/07/23.
//

import Foundation

struct RMLocationConfiguration: Configuration {
    
    var estimatedHeightForItem: CGFloat {
        100.0
    }
    
    var cellHorizontalType: RMItemCell.Type {
        RMLocationHorizontalCell.self
    }
    
    var reuseID: String {
        "RMLocationHorizontalCell"
    }
    
    func endpointForPage(page: Int) -> RMEndpoint {
        RMLocationEndpoint.locationPage(page)
    }
    
    func getCellViewModelForEntity<T>(entity: T) -> RMItemCellViewModel? where T : Decodable {
        guard let rmLocation = entity as? RMLocation else {
            return nil
        }
        
        let viewModel = RMLocationCellViewModel(location: rmLocation)
        return viewModel
    }
    
    func getClickableAction<T>(for entity: T) -> ClickableAction? where T : Decodable {
        guard let location = entity as? RMLocation else {
            return nil
        }
        
        let viewModel = RMLocationDetailViewModel(location: location)
        let view = RMLocationDetailView(viewModel: viewModel)
        let viewController = RMHostingController(entityDetailView: view)
        
        return .pushVC(viewController)
    }
    
    
}

