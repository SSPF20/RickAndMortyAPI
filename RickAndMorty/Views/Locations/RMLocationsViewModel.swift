//
//  RMLocationsViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 6/07/23.
//

import UIKit

final class RMLocationsViewModel {
    
    let dataProvider: RMDataProvider<RMLocation, RMLocationConfiguration>
    var locations: [[RMLocation]] = []
    
    init(dataProvider: RMDataProvider<RMLocation, RMLocationConfiguration> = RMDataProvider<RMLocation, RMLocationConfiguration>(entity: RMEntity<RMLocation, RMLocationConfiguration>(configuration: RMLocationConfiguration()))) {
        self.dataProvider = dataProvider
    }
    
    func start() {
        Task {
            do {
                let response = try await dataProvider.getPage(page: 1)
                self.locations.append(response.results)
            } catch {
                print("Error loading first page \(String(describing: error))")
            }
        }
    }
}
