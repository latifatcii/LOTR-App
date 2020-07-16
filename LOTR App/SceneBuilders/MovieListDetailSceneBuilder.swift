//
//  MovieListDetailSceneBuilder.swift
//  LOTR App
//
//  Created by Latif Atci on 7/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

final class MovieListDetailSceneBuilder {
    
    static func build(with viewModel: MovieListDetailViewModel) -> MovieListDetailViewController {
        let storyboard = UIStoryboard(name: "MovieListDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieListDetailViewController") as! MovieListDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
