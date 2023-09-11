//
//  IntegerExtractor.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 10/09/23.
//

import Foundation

@propertyWrapper
struct IntegerExtractor: Decodable {
    
    enum IntegerExtractorError: Error {
        case noStringFound
        case noIntegerFound
    }
    
    var wrappedValue: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        guard let stringValue = try? container.decode(String.self) else {
            throw IntegerExtractorError.noStringFound
        }
        wrappedValue = try Self.getIntFrom(string: stringValue)
    }
    
    static func getIntFrom(string: String) throws -> Int {
        if let id = string.urlID {
            return id
        }
        throw IntegerExtractorError.noIntegerFound
    }
}

@propertyWrapper
struct IntegerArrayExtractor: Decodable {
    var wrappedValue: [Int]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let arrayStringsValue = try container.decode([String].self)
        let arrayIntegers = try arrayStringsValue.map { try IntegerExtractor.getIntFrom(string: $0) }
        wrappedValue = arrayIntegers
    }
}
