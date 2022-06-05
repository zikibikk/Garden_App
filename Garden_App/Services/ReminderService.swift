//
//  ReminderService.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 02.06.2022.
//

import Foundation

protocol IReminderService {
    func addReminder(reminder: ReminderStruct)
}

class ReminderService: IReminderService {
    private let repository: IReminderRepository
    
    init(repository: IReminderRepository) {
        self.repository = repository
    }
    
    func addReminder(reminder: ReminderStruct) {
        repository.saveReminder(reminder: reminder)
        print(repository.getReminders().count)
    }
}
