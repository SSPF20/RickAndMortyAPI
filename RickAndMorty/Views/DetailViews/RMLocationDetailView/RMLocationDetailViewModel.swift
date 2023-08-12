//
//  RMLocationDetailsViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 1/08/23.
//

import Foundation

final class RMLocationDetailViewModel: ObservableObject {
    
    let location: RMLocation
    
    init(location: RMLocation) {
        self.location = location
    }
    
    var name: String {
        location.name
    }
    
    var type: String {
        location.type
    }
    
    var dimension: String {
        location.dimension
    }
    
    var characterIds: [Int] {
        location.residents.compactMap { $0.absoluteString.urlID }
    }
}
