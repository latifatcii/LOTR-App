//
//  LOTR_AppTests.swift
//  LOTR AppTests
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import XCTest
@testable import LOTR_App

class LOTR_AppTests: XCTestCase {

    func testParsing() throws {
        
        let bundle = Bundle(for: LOTR_AppTests.self)
        let url = bundle.url(forResource: "quote", withExtension: "json")
        let data = try Data(contentsOf: url!)
        let decoder = JSONDecoder()
        let loadedData = try decoder.decode(QuoteResponses.self, from: data)
        
        XCTAssertEqual(loadedData.quote.count, 1)
        XCTAssertEqual(loadedData.quote[0].id, "5cd96e05de30eff6ebcce7e9")
        XCTAssertEqual(loadedData.quote[0].character, "5cd99d4bde30eff6ebccfe9e")
        XCTAssertEqual(loadedData.quote[0].dialog, "Deagol!")
        XCTAssertEqual(loadedData.quote[0].movie, "5cd95395de30eff6ebccde5d")
        
    }
}
