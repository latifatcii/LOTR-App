//
//  Quote.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct Quote: Decodable {
    let id, dialog: String
    let movie: String
    let character: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case dialog, movie, character
    }
}

