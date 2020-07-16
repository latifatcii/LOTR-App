//
//  MovieListDetailContracts.swift
//  LOTR App
//
//  Created by Latif Atci on 7/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

protocol MovieListDetailProtocol {
    var delegate: MovieListDetailDelegate? { get set }
    func load()
}

enum MovieListDetailOutput {
    case showMovieName(String)
}

protocol MovieListDetailDelegate: class {
    func handleMovieListDetailOutput(_ output: MovieListDetailOutput)
}
