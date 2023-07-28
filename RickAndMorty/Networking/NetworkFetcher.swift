//
//  NetworkFetcher.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 10/06/23.
//

import Foundation

protocol NetworkFetcher {
    func fetch<T: Decodable>(endpoint: RMEndpoint) async throws -> T
}

enum NetworkError: Error {
    case networkError(Error)
    case decodingError(Error)
}

struct DefaultNetworkFetcher: NetworkFetcher {
    
    let urlSession: URLSession
    let decoder: JSONDecoder
    
    init(urlSession: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.urlSession = urlSession
        self.decoder = decoder
    }
    
    func fetch<T: Decodable>(endpoint: RMEndpoint) async throws -> T {
        do {
            let (data, _) = try await urlSession.data(for: endpoint.urlRequest)
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Format)
            let response = try decoder.decode(T.self, from: data)
            return response
        } catch let error as DecodingError {
            throw NetworkError.decodingError(error)
        } catch {
            throw NetworkError.networkError(error)
        }
    }
}
