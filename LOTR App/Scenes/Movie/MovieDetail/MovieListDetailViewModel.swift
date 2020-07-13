//
//  MovieListDetailViewModel.swift
//  LOTR App
//
//  Created by Latif Atci on 7/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

final class MovieListDetailViewModel: MovieListDetailProtocol {
    
    weak var delegate: MovieListDetailDelegate?
    var movie: MoviePresentation
    
    init(_ movie: MoviePresentation) {
        self.movie = movie
    }
    
    func load() {
        delegate?.handleMovieListDetailOutput(.showMovieName(movie.name))
    }
    
}
