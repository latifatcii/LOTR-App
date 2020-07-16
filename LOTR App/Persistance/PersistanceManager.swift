//
//  PersistanceManager.swift
//  LOTR App
//
//  Created by Latif Atci on 7/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit
import CoreData

final class PersistanceManager: PersistanceManagerProtocol {

    typealias T = BookPresentation
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func saveData(data: BookPresentation) {
        let favorites = Favorites(context: appDelegate.persistentContainer.viewContext)
        favorites.id = data.id
        favorites.name = data.name
        appDelegate.saveContext()
    }
    
    func fetchData(completion: @escaping (Result<[BookPresentation], PersistanceError>) -> ()) {
        let fetchRequest = NSFetchRequest<Favorites>(entityName: "Favorites")
        
        do {
            let favorites = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            let books = favorites.map({
                book in BookPresentation(book: Books(id: book.id!, name: book.name!))
            })
            completion(.success(books))
        } catch {
            completion(.failure(.fetchingError))
        }
    }
    
    func removeData(id: String, completion: @escaping (PersistanceError) -> ()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        let request = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try appDelegate.persistentContainer.viewContext.execute(request)
            appDelegate.saveContext()
        } catch {
            completion(.removingError)
        }
    }
    
    func checkData(id: String, completion: @escaping (Result<Bool,PersistanceError>) -> ()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let booksCount = try appDelegate.persistentContainer.viewContext.count(for: fetchRequest)
            if booksCount > 0 {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        } catch {
            completion(.failure(.checkingError))
        }
    }
}

