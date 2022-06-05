//
//  ReminderRepository.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 05.06.2022.
//

import Foundation

protocol IReminderRepository {
    func saveReminder(reminder: ReminderStruct)
    func getReminders() -> [ReminderStruct]
}

class ReminderRepository: IReminderRepository {
    private let coreDataService: CoreDataService
    
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }
    
    func saveReminder(reminder: ReminderStruct) {
        
        coreDataService.viewContext.perform { [weak self] in
            guard let context = self?.coreDataService.viewContext else { return }
            let reminderEntity = ReminderEntity(context: context)
            reminderEntity.setUp(reminder: reminder)
            
            do { try context.save() }
            catch let error { print("Error: \(error)") }
        }
    }
    
    func getReminders() -> [ReminderStruct] {
        var reminders: [ReminderStruct] = []
        let fetchRequest = ReminderEntity.remindFetchRequest()
        
        do {
            let entities = try self.coreDataService.viewContext.fetch(fetchRequest)
            for entity in entities {
                let reminder = ReminderStruct(reminderEntity: entity)
                reminders.append(reminder)
            }
        } catch let error {
            print("Error: \(error)")
        }
        return reminders
    }
}
