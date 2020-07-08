//
//  LOTRService.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

protocol LOTRServiceProtocol {
    func fetchBooks(completion: @escaping (Result<BooksResponses,NetworkResponse>) -> Void)
    func fetchQuote(completion: @escaping (Result<QuoteResponses,NetworkResponse>) -> Void)
    func fetchMovie(completion: @escaping (Result<MovieResponses,NetworkResponse>) -> Void)
    func fetchChapter(completion: @escaping (Result<ChapterResponses,NetworkResponse>) -> Void)
    func fetchCharacter(completion: @escaping (Result<CharacterResponses,NetworkResponse>) -> Void)
}

class LOTRService: LOTRServiceProtocol {
    func fetchBooks(completion: @escaping (Result<BooksResponses, NetworkResponse>) -> Void) {
        apiRequest(RequestType.book, completion: completion)
    }
    
    func fetchMovie(completion: @escaping (Result<MovieResponses, NetworkResponse>) -> Void) {
        apiRequest(RequestType.movie, completion: completion)
    }
    
    func fetchQuote(completion: @escaping (Result<QuoteResponses, NetworkResponse>) -> Void) {
        apiRequest(RequestType.quote, completion: completion)
    }

    func fetchChapter(completion: @escaping (Result<ChapterResponses, NetworkResponse>) -> Void) {
        apiRequest(RequestType.chapter, completion: completion)
    }
    
    func fetchCharacter(completion: @escaping (Result<CharacterResponses, NetworkResponse>) -> Void) {
        apiRequest(RequestType.character, completion: completion)
    }
    
    func apiRequest<T: Decodable>(_ requestType: RequestType, completion: @escaping (Result<T,NetworkResponse>) -> Void) {
        
        URLSession.shared.dataTask(with: requestType.createURLRequest()!) { (data, _, error) in
            if let _ = error {
                completion(.failure(.failed))
            }
            guard let data = data else {
                completion(.failure(.badRequest))
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.unableToDecode))
            }
        }.resume()
    }
}
