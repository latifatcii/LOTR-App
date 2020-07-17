//
//  BaseTableViewCell.swift
//  LOTR App
//
//  Created by Latif Atci on 7/17/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

protocol BaseCellDelegate: class {
    func favButtonTapped(indexPath: IndexPath)
}

final class BaseTableViewCell: UITableViewCell {
    
    weak var delegate: BaseCellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    var index: IndexPath!


    @IBAction func favButtonTapped(_ sender: UIButton) {
        delegate?.favButtonTapped(indexPath: index)
    }
    
    func switchFavButtonImage(isDataFavorited: Bool) {
        if isDataFavorited {
            favButton.setImage(UIImage(named: "star.fill"), for: .normal)
        } else {
            favButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
}
