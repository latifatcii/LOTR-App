//
//  BookListSceneBuilder.swift
//  LOTR App
//
//  Created by Latif Atci on 7/8/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

final class BookListSceneBuilder {
    
    static func build() -> BookListViewController {
        let storyboard = UIStoryboard(name: "BookList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "BookListViewController") as! BookListViewController
        viewController.viewModel = BookListViewModel()
        return viewController
    }
}
