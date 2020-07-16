//
//  CharacterResponses.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct CharacterResponses: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case docs
    }
    
    let character: [Character]
    
    init(character: [Character]) {
        self.character = character
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        self.character = try rootContainer.decode([Character].self, forKey: .docs)
    }
}
