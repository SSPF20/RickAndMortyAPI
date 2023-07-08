//
//  CoreDataStack.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 7/07/23.
//

import Foundation
import CoreData

protocol CoreDataStack {
    var managedContext: NSManagedObjectContext { get }
    func save()
}

final class DefaultCoreDataStack: CoreDataStack {

    static let shared: CoreDataStack = DefaultCoreDataStack()
    
    private let container: NSPersistentContainer
    private(set) lazy var managedContext: NSManagedObjectContext = container.viewContext
    
    private init() {
        container = NSPersistentContainer(name: "RickAndMortyStorage")
        setupCoreData()
    }
    
    private func setupCoreData() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading store \(error)")
                return
            }
            print("Database ready!")
        }
    }
    
    func save() {
        saveContext()
    }
    
    func saveContext() {
        if managedContext.hasChanges {
            do {
                try managedContext.save()
            } catch {
                fatalError("Error saving context \(String(describing: error))")
            }
        }
    }
}
