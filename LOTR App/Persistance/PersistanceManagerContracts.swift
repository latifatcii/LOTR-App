//
//  PersistanceManagerContracts.swift
//  LOTR App
//
//  Created by Latif Atci on 7/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

protocol PersistanceManagerProtocol {
    associatedtype T
    func saveData(data: T)
    func removeData(id: String, completion: @escaping(PersistanceError) -> ())
    func fetchData(completion: @escaping(Result<[T],PersistanceError>) -> ())
    func checkData(id: Int, completion: @escaping(Bool) -> ())
}
