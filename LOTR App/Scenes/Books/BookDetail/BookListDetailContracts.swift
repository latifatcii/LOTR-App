//
//  BookListDetailContracts.swift
//  LOTR App
//
//  Created by Latif Atci on 7/10/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

protocol BookListDetailProtocol {
    var delegate: BookListDetailDelegate? { get set }
    func load()
}

enum BookListDetailOutput {
    case showBookName(String)
}

protocol BookListDetailDelegate: class {
    func handleBookListDetailOutput(_ output: BookListDetailOutput)
}
