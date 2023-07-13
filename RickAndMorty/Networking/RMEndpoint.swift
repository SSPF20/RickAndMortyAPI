//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 10/06/23.
//

import Foundation

protocol RMEndpoint {
    var urlRequest: URLRequest { get }
}

enum RMCharacterEndpoint: RMEndpoint {
    
    static let domain = "https://rickandmortyapi.com/api/"
    
    case characterPage(Int)
    case oneCharacter(Int)
    
    private var urlString: String {
        switch self {
        case .characterPage(let page):
            return Self.domain + "character/?page=\(page)"
        case.oneCharacter(let id):
            return Self.domain + "character/\(id)"
        }
    }
    
    var urlRequest: URLRequest {
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }
}

enum RMLocationEndpoint: RMEndpoint {
    
    static let domain = "https://rickandmortyapi.com/api/"
    
    case locationPage(Int)
    case oneLocation(Int)
    
    
    private var urlString: String {
        switch self {
        case .locationPage(let page):
            return Self.domain + "location/?page=\(page)"
            
        case .oneLocation(let id):
            return Self.domain + "location/\(id)"
        }
    }
    
    var urlRequest: URLRequest {
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }
}

enum RMEpisodeEndpoint: RMEndpoint {
    
    static let domain = "https://rickandmortyapi.com/api/"
    
    case episodePage(Int)
    case oneEpisode(Int)
    
    private var urlString: String {
        switch self {
        case .episodePage(let page):
            return Self.domain + "episode/?page=\(page)"
        case .oneEpisode(let id):
            return Self.domain + "episode/\(id)"
        }
    }
    
    var urlRequest: URLRequest {
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }
}

