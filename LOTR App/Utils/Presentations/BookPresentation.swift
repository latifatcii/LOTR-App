//
//  BookPresentation.swift
//  LOTR App
//
//  Created by Latif Atci on 7/8/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

final class BookPresentation: Equatable {
    
    let id, name: String
    
    init(book: Books) {
        self.id = book.id
        self.name = book.name
    }
    
    static func == (lhs: BookPresentation, rhs: BookPresentation) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
}
