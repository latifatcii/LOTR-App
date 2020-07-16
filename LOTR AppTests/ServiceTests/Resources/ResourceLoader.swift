//
//  ResourceLoader.swift
//  LOTR AppTests
//
//  Created by Latif Atci on 7/7/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation
@testable import LOTR_App

class ResourceLoader {
    
    enum ResourceType: String {
        case book
        case movie
        case quote
        case chapter
        case character
    }
    
    static func loadBook() throws -> BooksResponses {
        return try loadResource(resource: .book)
    }
    
    static func loadMovie() throws -> MovieResponses {
        return try loadResource(resource: .movie)
    }
    
    static func loadQuote() throws -> QuoteResponses {
        return try loadResource(resource: .quote)
    }

    static func loadChapter() throws -> ChapterResponses {
        return try loadResource(resource: .chapter)
    }
    
    static func loadCharacter() throws -> CharacterResponses {
        return try loadResource(resource: .chapter)
    }
    
    static func loadResource<T: Decodable>(resource: ResourceType) throws -> T {
        
        let bundle = Bundle(for: ResourceLoader.self)
        let url = bundle.url(forResource: resource.rawValue, withExtension: "json")
        let data = try Data(contentsOf: url!)
        let decoder = JSONDecoder()
        let loadedData = try decoder.decode(T.self, from: data)
        
        return loadedData
    }
}
