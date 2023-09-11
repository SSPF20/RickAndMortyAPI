//
//  IntegerExtractorTests.swift
//  RickAndMortyTests
//
//  Created by Horacio Guzman on 10/09/23.
//

import XCTest
@testable import RickAndMorty

final class IntegerExtractorTests: XCTestCase {

    final class IntegerExtractorHelper: Decodable {
        @IntegerExtractor var pageID: Int
        @IntegerExtractor var id: Int
        @IntegerArrayExtractor var arrayIDs: [Int]
    }
    
    func test_extractorSuccess() throws {
        // Given
        let data = getData()
        // When
        let extractorHelper = try JSONDecoder().decode(IntegerExtractorHelper.self, from: data)
        // Then
        XCTAssertEqual(extractorHelper.pageID, 2)
        XCTAssertEqual(extractorHelper.id, 1)
        XCTAssertEqual(extractorHelper.arrayIDs.count, 2)
        XCTAssertEqual(extractorHelper.arrayIDs.first, 10)
        XCTAssertEqual(extractorHelper.arrayIDs.last, 20)
    }
    
    func test_LocationBasic_Decode() throws {
        // Given
        let dataDictionary = [
            "name": "Earth",
            "url": "https://rickandmortyapi.com/api/location/20"
        ]
        let data = try JSONEncoder().encode(dataDictionary)
        // When
        let location = try JSONDecoder().decode(LocationBasic.self, from: data)
        // Then
        XCTAssertEqual(location.id, 20)
        XCTAssertEqual(location.name, "Earth")
    }
    
    func test_firstCharacterPageDecoding() throws {
        // Given
        let data = MockResponses.charactersFirstPageResponse.data(using: .utf8)!
        // When
        // Then
        XCTAssertNoThrow(try JSONDecoder().decode(RMResponse<RMCharacter>.self, from: data))
    }

    private func getData() -> Data {
        
        struct MockDataHelper: Encodable {
            var pageID: String
            var id: String
            var arrayIDs: [String]
        }
        
        let arrayEncodable: [String] = [
            "https://rickandmortyapi.com/api/episode/10",
            "https://rickandmortyapi.com/api/episode/20"
        ]
        
        let mockDataHelper = MockDataHelper(pageID: "https://rickandmortyapi.com/api/character/?page=2",
                                            id: "https://rickandmortyapi.com/api/character/1",
                                            arrayIDs: arrayEncodable)
        
        return try! JSONEncoder().encode(mockDataHelper)
    }
}
