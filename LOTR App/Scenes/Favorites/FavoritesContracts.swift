//
//  FavoritesContracts.swift
//  LOTR App
//
//  Created by Latif Atci on 7/14/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

protocol FavoritesViewModelProtocol {
    var delegate: FavoritesViewModelDelegate? { get set }
    var favBooks: [BookPresentation] { get set }
    func fetchData()
    func removeData(at index: Int)
}

enum FavoritesViewModelOutput {
    case loading(Bool)
    case error(PersistanceError)
}

protocol FavoritesViewModelDelegate: class {
    func handleViewModelOutput(_ output: FavoritesViewModelOutput)
}
