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
    
    static func loadBook(resource: ResourceType) throws -> BooksResponses {
        return try loadResource(resource: resource)
    }
    
    static func loadMovie(resource: ResourceType) throws -> MovieResponses {
        return try loadResource(resource: resource)
    }
    
    static func loadQuote(resource: ResourceType) throws -> QuoteResponses {
        return try loadResource(resource: resource)
    }

    static func loadChapter(resource: ResourceType) throws -> ChapterResponses {
        return try loadResource(resource: resource)
    }
    
    static func loadCharacter(resource: ResourceType) throws -> CharacterResponses {
        return try loadResource(resource: resource)
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
