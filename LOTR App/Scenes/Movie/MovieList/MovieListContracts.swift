//
//  MovieListContracts.swift
//  LOTR App
//
//  Created by Latif Atci on 7/9/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    var movie: [MoviePresentation] { get set }
    func loadData()
    func deleteRow(at indexPath: IndexPath)
    func refreshData()
}

enum MovieListViewModelOutput: Equatable {
    case setLoading(Bool)
    case error(NetworkResponse)
    case showMovieList
}

protocol MovieListViewModelDelegate: class {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
}
