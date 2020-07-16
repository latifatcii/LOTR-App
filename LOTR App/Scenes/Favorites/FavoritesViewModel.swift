//
//  FavoritesViewModel.swift
//  LOTR App
//
//  Created by Latif Atci on 7/14/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

final class FavoritesViewModel: FavoritesViewModelProtocol {
    
    var favBooks: [BookPresentation] = []
    weak var delegate: FavoritesViewModelDelegate?
    var persistanceService: BooksPersistanceManager
    
    init(persistance: BooksPersistanceManager = BooksPersistanceManager()) {
        self.persistanceService = persistance
    }
    
    func fetchData() {
        delegate?.handleViewModelOutput(.loading(true))
        persistanceService.fetchData { [weak self] (response) in
            guard let self = self else { return }
            self.delegate?.handleViewModelOutput(.loading(false))
            switch response {
            case .success(let books):
                self.favBooks = books
            case .failure(let persistanceError):
                self.delegate?.handleViewModelOutput(.error(persistanceError))
            }
        }
    }
    
    func removeData(at index: Int) {
        persistanceService.removeData(id: favBooks[index].id) { [weak self] (persistanceError) in
            guard let self = self else { return }
            self.delegate?.handleViewModelOutput(.error(persistanceError))
        }
        favBooks.remove(at: index)
    }
}
