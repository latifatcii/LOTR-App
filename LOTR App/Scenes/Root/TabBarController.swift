//
//  TabBarController.swift
//  LOTR App
//
//  Created by Latif Atci on 7/7/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        tabBar.tintColor = .yellow
        tabBar.unselectedItemTintColor = .white
        configureTabBar()
    }
    
    private func configureTabBar() {
        let bookVC = BookListSceneBuilder.build()
        bookVC.title = "Books"
        bookVC.tabBarItem = UITabBarItem(title: "Book", image: UIImage(named: "book"), tag: 0)
        let bookNC = UINavigationController(rootViewController: bookVC)
        
        let movieVC = MovieListSceneBuilder.build()
        movieVC.title = "Movies"
        movieVC.tabBarItem = UITabBarItem(title: "Movie", image: UIImage(named: "movie"), tag: 1)
        let movieNC = UINavigationController(rootViewController: movieVC)
        
        let favoriteVC = FavoritesSceneBuilder.build()
        favoriteVC.title = "Favorites"
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "bookmark"), tag: 2)
        let favoriteNC = UINavigationController(rootViewController: favoriteVC)
        viewControllers = [bookNC, movieNC, favoriteNC]
    }
}
