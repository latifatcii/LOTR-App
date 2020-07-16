//
//  MoviesPersistanceManager.swift
//  LOTR App
//
//  Created by Latif Atci on 7/16/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit
import CoreData

final class MoviesPersistanceManager: PersistanceManagerProtocol {
    
    typealias T = MoviePresentation
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func saveData(data: MoviePresentation) {
        let favorites = Favorites(context: appDelegate.persistentContainer.viewContext)
        favorites.id = data.id
        favorites.name = data.name
        appDelegate.saveContext()
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
    
    func fetchData(completion: @escaping (Result<[MoviePresentation], PersistanceError>) -> ()) {
        let fetchRequest = NSFetchRequest<Favorites>(entityName: "Favorites")
        
        do {
            let favorites = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            let movies = favorites.map({
                movie in MoviePresentation(movie: Movie(id: movie.id!, name: movie.name!))
            })
            completion(.success(movies))
        } catch {
            completion(.failure(.fetchingError))
        }
    }
    
    func checkData(id: String, completion: @escaping (Result<Bool, PersistanceError>) -> ()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let moviesCount = try appDelegate.persistentContainer.viewContext.count(for: fetchRequest)
            if moviesCount > 0 {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        } catch {
            completion(.failure(.checkingError))
        }
    }
    
    
}
