//
//  BookListViewModel.swift
//  LOTR App
//
//  Created by Latif Atci on 7/7/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

//This ViewModel responsible for BookListViewControllers business logic.
final class BookListViewModel: BookListViewModelProtocol {
    
    weak var delegate: BookListViewModelDelegate?
    private let service: LOTRServiceProtocol
    
    init(_ service: LOTRServiceProtocol = LOTRService()) {
        self.service = service
    }
    
    // MARK: - Fetch Data From Service
    func loadData() {
        delegate?.handleViewModelOutput(.setLoading(true))
        
        service.fetchBooks { [weak self] (result) in
            guard let self = self else { return }
            self.delegate?.handleViewModelOutput(.setLoading(false))
            
            switch result {
            case .success(let response):
                let bookPresentations = response.books.map { BookPresentation(book: $0) }
                self.delegate?.handleViewModelOutput(.showBookList(bookPresentations))
            case .failure(let error):
                self.delegate?.handleViewModelOutput(.error(error))
            }
        }
    }
    
    
}