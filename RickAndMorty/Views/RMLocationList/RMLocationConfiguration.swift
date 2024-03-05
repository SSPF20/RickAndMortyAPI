//
//  RMLocationConfiguration.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 10/07/23.
//

import Foundation

struct RMLocationConfiguration: UniversalConfiguration {
    
    func endpointForPage(page: Int) -> RMEndpoint {
        RMLocationEndpoint.locationPage(page)
    }
    
    
}

