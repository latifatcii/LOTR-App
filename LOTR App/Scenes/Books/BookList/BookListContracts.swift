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
}

enum BookListViewModelOutput: Equatable {
    case setLoading(Bool)
    case error(NetworkResponse)
    case showBookList
}

protocol BookListViewModelDelegate: class {
    func handleViewModelOutput(_ output: BookListViewModelOutput)
    
}
