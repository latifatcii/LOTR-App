//
//  MovieListViewModel.swift
//  LOTR App
//
//  Created by Latif Atci on 7/9/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

//This ViewModel responsible for MovieListViewControllers business logic.
final class MovieListViewModel: MovieListViewModelProtocol {

    var delegate: MovieListViewModelDelegate?
    var movie: [MoviePresentation] = []
    var service: LOTRServiceProtocol
    
    init(_ service: LOTRServiceProtocol = LOTRService()) {
        self.service = service
    }
    
    // MARK: - Fetch Data From Service
    func loadData() {
        delegate?.handleViewModelOutput(.setLoading(true))
        
        service.fetchMovie { [weak self] (result) in
            guard let self = self else { return }
            self.delegate?.handleViewModelOutput(.setLoading(false))
            
            switch result {
            case .success(let response):
                self.movie = response.movie.map { MoviePresentation(movie: $0) }
                self.delegate?.handleViewModelOutput(.showMovieList)
            case .failure(let error):
                self.delegate?.handleViewModelOutput(.error(error))
            }
        }
    }
    
    func deleteRow(at indexPath: IndexPath) {
        movie.remove(at: indexPath.row)
    }
    
    func refreshData() {
        movie.removeAll()
        loadData()
    }
    
    func selectMovie(at index: Int) {
        let vm = MovieListDetailViewModel(movie[index])
        delegate?.movieSceneRouter(.movieListDetails(vm))
    }
    
}
