//
//  BookListDetailViewController.swift
//  LOTR App
//
//  Created by Latif Atci on 7/10/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

class BookListDetailViewController: UIViewController {
    
    @IBOutlet weak var bookNameLabel: UILabel!
    
    var viewModel: BookListDetailProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}

extension BookListDetailViewController: BookListDetailDelegate {
    func handleBookListDetailOutput(_ output: BookListDetailOutput) {
        switch output {
        case .showBookName(let bookName):
            bookNameLabel.text = bookName
        }
    }
    
    
}
