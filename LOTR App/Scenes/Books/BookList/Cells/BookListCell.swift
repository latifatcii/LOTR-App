//
//  BookListCell.swift
//  LOTR App
//
//  Created by Latif Atci on 7/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

protocol BookListCellDelegate: class {
    func favButtonTapped(indexPath: IndexPath)
}

final class BookListCell: UITableViewCell {
    
    weak var delegate: BookListCellDelegate?
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    var index: IndexPath!
    

    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        delegate?.favButtonTapped(indexPath: index)
    }
    
    func configureCellOutlets(book: BookPresentation, index: IndexPath) {
        nameLabel.text = book.name
        idLabel.text = book.id
        self.index = index
    }
    
    func switchFavButtonImage(isBookFavorited: Bool) {
        if isBookFavorited {
            favButton.setImage(UIImage(named: "star.fill"), for: .normal)
        } else {
            favButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
}
