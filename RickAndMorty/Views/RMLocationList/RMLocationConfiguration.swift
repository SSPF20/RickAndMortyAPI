//
//  RMLocationConfiguration.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 10/07/23.
//

import Foundation

struct RMLocationConfiguration: Configuration {
    
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
    
    
    
}
