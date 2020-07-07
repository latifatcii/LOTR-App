//
//  QuoteResponses.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct QuoteResponses: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case docs
    }
    
    let quote: [Quote]
    
    init(quote: [Quote]) {
        self.quote = quote
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        self.quote = try rootContainer.decode([Quote].self, forKey: .docs)
    }
    
}
