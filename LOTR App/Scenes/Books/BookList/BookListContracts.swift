//
//  BookListContracts.swift
//  LOTR App
//
//  Created by Latif Atci on 7/8/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

protocol BookListViewModelProtocol {
    var delegate: BookListViewModelDelegate? { get set }
    var books: [BookPresentation] { get set }
    func loadData()
    func deleteRow(at indexPath: IndexPath)
    func refreshData()
    func selectBook(at index: Int)
    func favBook(at index: Int)
    func checkIfBookFavorited(at index: Int)
}

enum BookListViewModelOutput: Equatable {
    case setLoading(Bool)
    case error(NetworkResponse)
    case isBookFavorited(Bool)
    case showBookList
}

protocol BookListViewModelDelegate: class {
    func handleViewModelOutput(_ output: BookListViewModelOutput)
    func bookSceneRouter(_ router: BookListRouter)
}

enum BookListRouter {
    case bookListDetails(_ viewModel: BookListDetailViewModel)
}
