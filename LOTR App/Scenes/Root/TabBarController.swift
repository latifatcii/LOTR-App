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
        configureTabBar()
    }
    
    private func configureTabBar() {
        let bookVC = BookListSceneBuilder.build()
        bookVC.title = "Books"
        bookVC.tabBarItem = UITabBarItem(title: "Books", image: nil, tag: 0)
        let bookNC = UINavigationController(rootViewController: bookVC)
        
        viewControllers = [bookNC]
    }
}
