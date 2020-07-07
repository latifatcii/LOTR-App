//
//  Movie.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let id, name: String
    let runtimeInMinutes, budgetInMillions: Int
    let boxOfficeRevenueInMillions: Double
    let academyAwardNominations, academyAwardWINS: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, runtimeInMinutes, budgetInMillions, boxOfficeRevenueInMillions, academyAwardNominations
        case academyAwardWINS = "academyAwardWins"
    }
}
