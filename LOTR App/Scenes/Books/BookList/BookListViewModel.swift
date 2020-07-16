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
    var books: [BookPresentation] = []
    let persistance = PersistanceManager()
    
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
                self.books = response.books.map { BookPresentation(book: $0) }
                self.delegate?.handleViewModelOutput(.showBookList)
            case .failure(let error):
                self.delegate?.handleViewModelOutput(.error(error))
            }
        }
    }
    
    func deleteRow(at indexPath: IndexPath) {
        books.remove(at: indexPath.row)
    }
    
    func refreshData() {
        books.removeAll()
        loadData()
    }
    
    func selectBook(at index: Int) {
        let book = books[index]
        let viewModel = BookListDetailViewModel(book)
        delegate?.bookSceneRouter(.bookListDetails(viewModel))
    }
    
    func favBook(at index: Int) {
        persistance.saveData(data: books[index]) 
    }
}
