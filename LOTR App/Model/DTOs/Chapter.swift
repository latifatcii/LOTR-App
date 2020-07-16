//
//  Chapter.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct Chapter: Decodable {
    
    let id: String
    let book: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case book
    }
}
