//
//  RMCharacterDataFetcher.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 10/06/23.
//

import Foundation
import UIKit

//protocol RMEntity: Decodable {
//    associatedtype T: Decodable
//    static func endpointForPage(page: Int) -> RMEndpoint
//    static var cellHorizontalType: RMItemCell.Type { get }
//    func getViewModel(entity: T) -> RMItemCellViewModel
//    static var reuseID: String { get }
//}
//
//extension RMEntity {
//    static var associatedType: Self.T.Type {
//        T.self
//    }
//}

protocol Configuration {
    func endpointForPage(page: Int) -> RMEndpoint
    var cellHorizontalType: RMItemCell.Type { get }
    var reuseID: String { get }
    
    func getCellViewModelForEntity<T: Decodable>(entity: T) -> RMItemCellViewModel?
}

struct RMEntity<T: Decodable, C: Configuration> {
    
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

struct RMDataProvider<A: Decodable, B: Configuration> {
    
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

struct RMCharacterConfiguration: Configuration {
    
    var cellHorizontalType: RMItemCell.Type {
        RMCharacterHorizontalCell.self
    }
    
    var reuseID: String {
        "RMCharacterHorizontalCell"
    }
    
    func endpointForPage(page: Int) -> RMEndpoint {
        RMCharacterEndpoint.characterPage(page)
    }
    
    func getCellViewModelForEntity<T: Decodable>(entity: T) -> RMItemCellViewModel? {
        guard let rmCharacter = entity as? RMCharacter else {
            return nil
        }
        
        let viewModel = RMCharacterCellViewModel(character: rmCharacter)
        return viewModel
    }
}

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
