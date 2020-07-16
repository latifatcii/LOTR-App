//
//  Character.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct Character: Decodable {
    
    let id, height, race, gender: String?
    let birth, spouse, death, realm: String?
    let hair, name: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case height, race, gender, birth, spouse, death, realm, hair, name
    }
}
