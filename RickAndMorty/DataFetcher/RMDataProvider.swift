//
//  RMCharacterDataFetcher.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 10/06/23.
//

import Foundation
import UIKit

// TODO: - Rename when UIKit tableViews are deprecated
protocol UniversalConfiguration {
    func endpointForPage(page: Int) -> RMEndpoint
}

protocol Configuration: UniversalConfiguration {
    var cellHorizontalType: RMItemCell.Type { get }
    var reuseID: String { get }
    var estimatedHeightForItem: CGFloat { get }
    
    func getCellViewModelForEntity<T: Decodable>(entity: T) -> RMItemCellViewModel?
    func getClickableAction<T: Decodable>(for entity: T) -> ClickableAction?
}

struct RMEntity<T: Decodable, C: UniversalConfiguration> {
    
    let configuration: C
    
    init(configuration: C) {
        self.configuration = configuration
    }
    
    static var entityType: Decodable.Type {
        T.self
    }
    
    func endpointForPage(page: Int) -> RMEndpoint {
        configuration.endpointForPage(page: page)
    }
}

struct RMDataProvider<A: Decodable, B: UniversalConfiguration> {
    
    let networkFetcher: NetworkFetcher
    let entity: RMEntity<A, B>
    
    init(networkFetcher: NetworkFetcher = DefaultNetworkFetcher(), entity: RMEntity<A, B>) {
        self.entity = entity
        self.networkFetcher = networkFetcher
    }
    
    func getPage(page: Int) async throws -> RMResponse<A> {
        try await networkFetcher.fetch(endpoint: entity.endpointForPage(page: page))
    }
}
