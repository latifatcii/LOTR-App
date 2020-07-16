//
//  MockService.swift
//  LOTR AppTests
//
//  Created by Latif Atci on 7/7/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation
@testable import LOTR_App

class MockService: LOTRServiceProtocol {
    
    var books: BooksResponses?
    var quote: QuoteResponses?
    var movie: MovieResponses?
    var chapter: ChapterResponses?
    var character: CharacterResponses?
    
    func fetchBooks(completion: @escaping (Result<BooksResponses, NetworkResponse>) -> Void) {
        completion(.success(books!))
    }
    
    func fetchQuote(completion: @escaping (Result<QuoteResponses, NetworkResponse>) -> Void) {
        completion(.success(quote!))
    }
    
    func fetchMovie(completion: @escaping (Result<MovieResponses, NetworkResponse>) -> Void) {
        completion(.success(movie!))
    }
    
    func fetchChapter(completion: @escaping (Result<ChapterResponses, NetworkResponse>) -> Void) {
        completion(.success(chapter!))
    }
    
    func fetchCharacter(completion: @escaping (Result<CharacterResponses, NetworkResponse>) -> Void) {
        completion(.success(character!))
    }
    
    
}
