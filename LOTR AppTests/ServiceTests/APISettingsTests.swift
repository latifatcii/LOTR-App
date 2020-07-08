//
//  APISettingsTests.swift
//  LOTR AppTests
//
//  Created by Latif Atci on 7/7/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import XCTest
@testable import LOTR_App

class APISettingsTests: XCTestCase {
    
    func testCreatedURLStringsMatched() {
        
        let bookRequest = RequestType.book
        let chapterRequest = RequestType.chapter
        let movieRequest = RequestType.movie
        let characterRequest = RequestType.character
        let quoteRequest = RequestType.quote
        
        XCTAssertEqual(bookRequest.createURLString(), "https://the-one-api.herokuapp.com/v1/book")
        XCTAssertEqual(chapterRequest.createURLString(), "https://the-one-api.herokuapp.com/v1/chapter")
        XCTAssertEqual(movieRequest.createURLString(), "https://the-one-api.herokuapp.com/v1/movie")
        XCTAssertEqual(characterRequest.createURLString(), "https://the-one-api.herokuapp.com/v1/character")
        XCTAssertEqual(quoteRequest.createURLString(), "https://the-one-api.herokuapp.com/v1/quote")
    }
}
