//
//  BookListDetailViewModel.swift
//  LOTR App
//
//  Created by Latif Atci on 7/10/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

final class BookListDetailViewModel: BookListDetailProtocol {
    
    weak var delegate: BookListDetailDelegate?
    var book: BookPresentation
    
    init(_ book: BookPresentation) {
        self.book = book
    }

    func load() {
        delegate?.handleBookListDetailOutput(.showBookName(book.name))
    }
}
