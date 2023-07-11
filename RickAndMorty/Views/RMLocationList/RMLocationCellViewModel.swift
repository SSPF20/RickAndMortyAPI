//
//  RMLocationCellViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 10/07/23.
//

import Foundation

final class RMLocationCellViewModel: RMItemCellViewModel {
    
    private let location: RMLocation
    
    var name: String {
        location.name
    }
    
    var type: String {
        location.type
    }
    
    var dimension: String {
        location.dimension
    }
    
    init(location: RMLocation) {
        self.location = location
        super.init(id: location.id)
    }
}
