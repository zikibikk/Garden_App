//
//  Repository.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 08.04.2022.
//

import Foundation
import CoreData

class Repository {
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Garden_App")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var viewContext = persistentContainer.viewContext

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if viewContext.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func saveNoteToCD(note: NoteStruct) {
        print(note.noteText)
    }
    
    func getAllReminders() -> [ReminderStruct] {
        return [.init(reminderText: "Посадить Клён", reminderDate: Date(timeIntervalSince1970: 1659689576), remindersPlants: nil),
                .init(reminderText: "Полить клубнику", reminderDate: Date(timeIntervalSince1970: 1662367976), remindersPlants: nil)]
    }
}
