//
//  MovieListCell.swift
//  LOTR App
//
//  Created by Latif Atci on 7/16/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit


final class MovieListCell: UITableViewCell {
    
    weak var delegate: BookListCellDelegate?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    var index: IndexPath!
    
    @IBAction func favButtonTapped(_ sender: UIButton) {
        delegate?.favButtonTapped(indexPath: index)
    }
    
    func configureCellOutlets(movie: MoviePresentation, index: IndexPath) {
        nameLabel.text = movie.name
        idLabel.text = movie.id
        self.index = index
    }
    
    func switchFavButtonImage(isMovieFavorited: Bool) {
        if isMovieFavorited {
            favButton.setImage(UIImage(named: "star.fill"), for: .normal)
        } else {
            favButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
}
