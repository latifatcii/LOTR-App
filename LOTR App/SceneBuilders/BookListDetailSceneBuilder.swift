//
//  BookListDetailBuilder.swift
//  LOTR App
//
//  Created by Latif Atci on 7/10/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

final class BookListDetailSceneBuilder {
    
    static func build(with viewModel: BookListDetailViewModel) -> BookListDetailViewController {
        let storyboard = UIStoryboard(name: "BookListDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "BookListDetailViewController") as! BookListDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}

