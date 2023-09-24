//
//  RMLocationDetailViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 1/09/23.
//

import Foundation
import Observation

@Observable
final class RMLocationDetailViewModel {
    
    private let location: RMLocation
    
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
    
    var residentsId: [Int] {
        location.residents.compactMap {$0.description.urlID}
    }
}
