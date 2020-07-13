//
//  MovieListDetailViewController.swift
//  LOTR App
//
//  Created by Latif Atci on 7/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

class MovieListDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var viewModel: MovieListDetailProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}

extension MovieListDetailViewController: MovieListDetailDelegate {
    
    func handleMovieListDetailOutput(_ output: MovieListDetailOutput) {
        switch output {
        case .showMovieName(let movieName):
            nameLabel.text = movieName
        }
    }
    
    
}
