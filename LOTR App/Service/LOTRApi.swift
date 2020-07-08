//
//  LOTRApi.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

enum RequestType {
    case book
    case movie
    case quote
    case chapter
    case character
}

// Creates paths depends on request type
extension RequestType: APISetting {
    var path: String {
        switch self {
        case .book:
            return "/v1/book"
        case .movie:
            return "/v1/movie"
        case .chapter:
            return "/v1/chapter"
        case .character:
            return "/v1/character"
        case .quote:
            return "/v1/quote"
            
        }
    }
    
    
}
