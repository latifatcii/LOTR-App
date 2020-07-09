//
//  MovieListSceneBuilder.swift
//  LOTR App
//
//  Created by Latif Atci on 7/9/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

final class MovieListSceneBuilder {
    
    //Build MovieListViewController with storyboard
    static func build() -> MovieListViewController {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        viewController.viewModel = MovieListViewModel()
        return viewController
    }
}
