//
//  PersistanceError.swift
//  LOTR App
//
//  Created by Latif Atci on 7/16/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

enum PersistanceError: String, Error {
    case savingError = "Data couldn't be saved"
    case removingError = "Data couldn't be removed"
    case fetchingError = "Data couldn't be fetched"
    case checkingError = "Data couldn't be checked"
    case noError
}
