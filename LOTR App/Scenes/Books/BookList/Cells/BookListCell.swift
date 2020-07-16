//
//  BookListCell.swift
//  LOTR App
//
//  Created by Latif Atci on 7/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

protocol BookListCellDelagete: class {
    func favButtonTapped(indexPath: IndexPath)
}

final class BookListCell: UITableViewCell {
    
    weak var delegate: BookListCellDelagete?
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    var index: IndexPath!
    

    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        delegate?.favButtonTapped(indexPath: index)
    }
    
    func switchFavButtonImage() {
        if favButton.currentImage == UIImage(named: "star") {
            print("aaa")
        }
        
    }
}
