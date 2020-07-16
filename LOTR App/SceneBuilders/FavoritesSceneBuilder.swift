//
//  FavoritesSceneBuilder.swift
//  LOTR App
//
//  Created by Latif Atci on 7/14/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

final class FavoritesSceneBuilder {
    
    static func build() -> FavoritesViewController {
        let storyboard = UIStoryboard(name: "FavoritesList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController") as! FavoritesViewController
        viewController.viewModel = FavoritesViewModel()
        return viewController
    }
}
