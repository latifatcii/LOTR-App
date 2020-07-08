//
//  BookListViewModel.swift
//  LOTR App
//
//  Created by Latif Atci on 7/7/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

final class BookListViewModel: BookListViewModelProtocol {
    
    weak var delegate: BookListViewModelDelegate?
    private let service: LOTRServiceProtocol
    var books: [Books] = []
    
    init(_ service: LOTRServiceProtocol = LOTRService()) {
        self.service = service
    }
    
    func loadData() {
        delegate?.handleViewModelOutput(.setLoading(true))
        
        service.fetchBooks { [weak self] (result) in
            guard let self = self else { return }
            self.delegate?.handleViewModelOutput(.setLoading(false))
            
            switch result {
            case .success(let response):
                self.books = response.books
                let bookPresentation = response.books.map { BookPresentation(book: $0) }
                self.delegate?.handleViewModelOutput(.showBookList(bookPresentation))
            case .failure(let error):
                self.delegate?.handleViewModelOutput(.error(error))
            }
        }
    }
    
    
}
