//
//  Repository.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 08.04.2022.
//

import Foundation
import CoreData

class CoreDataService {
    private let queue = DispatchQueue(label: "CoreDataSerialQueue")
    
    // MARK: - Core Data stack
    private lazy var persistentContainer: NSPersistentContainer = {
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
    
    func getAllReminders() -> [ReminderStruct] {
        // TODO: (r.akhmadeev) Этот мок не должен быть в настоящем CoreDataService
        // Создайте отдельный CoreDataServiceMock, и мокайте любые его методы
        return [.init(reminderText: "Посадить Клён", reminderDate: Date(timeIntervalSince1970: 1659689576)),
                .init(reminderText: "Полить клубнику", reminderDate: Date(timeIntervalSince1970: 1662367976))]
    }
    
    func fetch<T: NSFetchRequestResult>(_ fetchRequest: NSFetchRequest<T>, completion: @escaping ([T]?) -> Void) {
        queue.async {
            let result = try? self.viewContext.fetch(fetchRequest)
            completion(result)
        }
    }
}

extension CoreDataService {
    
    private func checkId(_ objectId: Int, entityType: NSManagedObject.Type) -> Bool {
        let fetchRequest = entityType.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %ld", objectId)
        let object = try? viewContext.fetch(fetchRequest).first
        return object == nil
    }
    
    func contextProvider(_ provider: @escaping (NSManagedObjectContext) -> Void) {
        queue.async {
            provider(self.viewContext)
            self.saveContext()
        }
    }
    
    func getAvailableId(initialId id: Int, for entityType: NSManagedObject.Type) -> Int {
        return checkId(id, entityType: entityType) ? id : getAvailableId(initialId: id + 1, for: entityType)
    }
    
}
