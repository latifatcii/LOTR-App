//
//  TabBar.swift
//  LOTR App
//
//  Created by Latif Atci on 7/17/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

final class TabBar: UITabBar {
    
    
    override func draw(_ rect: CGRect) {
        let deviceHeight = UIScreen.main.bounds.size.height
        
        if deviceHeight > 800 {
            let shape = UIBezierPath(roundedRect: CGRect(x: 50, y: 0, width: frame.width - frame.width / 4 , height: frame.height / 2 + 10), cornerRadius: CGFloat(1000.0))
            UIColor.darkGray.setFill()
            shape.fill()
        } else {
            let shape = UIBezierPath(roundedRect: CGRect(x: 50, y: 0, width: frame.width - frame.width / 4 , height: frame.height / 2 + 35), cornerRadius: CGFloat(1000.0))
            UIColor.darkGray.setFill()
            shape.fill()        }
        
        
    }
    
}

