//
//  MoviePresentation.swift
//  LOTR App
//
//  Created by Latif Atci on 7/9/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

final class MoviePresentation: Equatable {

    let id, name: String
    
    init(movie: Movie) {
        self.id = movie.id
        self.name = movie.name
    }
    
    static func == (lhs: MoviePresentation, rhs: MoviePresentation) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
