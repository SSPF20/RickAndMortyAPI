//
//  RMCharacterCoreDataManager.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 7/07/23.
//

import Foundation
import CoreData

protocol RMCharacterCoreDataManager {
    func save(character: RMCharacter)
    func getCharacter(id: Int) -> RMCharacter
}

struct DefaultRMCharacterCoreDataManager: RMCharacterCoreDataManager {
    
    private let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack = DefaultCoreDataStack.shared) {
        self.coreDataStack = coreDataStack
    }
    
    func save(character: RMCharacter) {
        _ = RMCharacterDB(context: coreDataStack.managedContext, character: character)
        coreDataStack.save()
    }
    
    func getCharacter(id: Int) -> RMCharacter {
        fatalError("Not implemented")
    }
    
}

extension RMCharacterDB {
    convenience init(context: NSManagedObjectContext, character: RMCharacter) {
        self.init(context: context)
        self.id = Int16(character.id)
        self.name = character.name
        self.status = character.status.rawValue
    }
}
