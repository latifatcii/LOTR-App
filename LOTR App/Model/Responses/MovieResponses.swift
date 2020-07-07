//
//  MovieResponses.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct MovieResponses: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case docs
    }
    
    let movie: [Movie]
    
    init(movie: [Movie]) {
        self.movie = movie
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        self.movie = try rootContainer.decode([Movie].self, forKey: .docs)
    }
    
}
