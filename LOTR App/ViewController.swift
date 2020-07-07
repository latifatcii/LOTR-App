//
//  ViewController.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let Lotr = LOTRService()
        Lotr.fetchCharacter { (resp) in
            switch resp{
            case .success(let a):
                print(a.character.count)
            case .failure(let e):
                print(e.rawValue)
            }
        }
        
        Lotr.fetchMovie { (resp) in
            switch resp{
            case .success(let a):
                print(a.movie.count)
            case .failure(let e):
                print(e.rawValue)
            }
        }
        
        Lotr.fetchQuote { (resp) in
            switch resp{
            case .success(let a):
                print(a.quote.count)
            case .failure(let e):
                print(e.rawValue)
            }
        }
        
        Lotr.fetchChapter { (resp) in
            switch resp{
            case .success(let a):
                print(a.chapter.count)
            case .failure(let e):
                print(e.rawValue)
            }
        }
        
        Lotr.fetchBooks { (r) in
            switch r{
            case .success(let a):
                print(a.books.count)
            case .failure(let r):
                print(r.rawValue)
            }
        }

    }


}

