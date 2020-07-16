//
//  ChapterResponses.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct ChapterResponses: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case docs
    }
    
    let chapter: [Chapter]
    
    init(chapter: [Chapter]) {
        self.chapter = chapter
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        self.chapter = try rootContainer.decode([Chapter].self, forKey: .docs)
    }
}
