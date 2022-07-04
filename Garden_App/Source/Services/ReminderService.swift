//
//  ReminderService.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 02.06.2022.
//

import Foundation

protocol IReminderService {
    func addReminder(reminder: ReminderStruct)
    // TODO: (r.akhmadeev) тут опционал не нужен. Если не получается найти модельки, то можно возвращать пустой массив
    func getRemindersByDate(date: Date) -> [ReminderStruct]?
}

class ReminderService: IReminderService {
    private let repository: IReminderRepository
    private let dateService: DateService
    
    init(repository: IReminderRepository, dateService: DateService) {
        self.repository = repository
        self.dateService = dateService
    }
    
    func getRemindersByDate(date: Date) -> [ReminderStruct]? {
        let searchingDate = dateService.getDateWithYear(date: date)
        let reminders = repository.getReminders()
        guard let reminders = reminders else { return nil }
        var result: [ReminderStruct] = []
        for reminder in reminders {
            if dateService.getDateWithYear(date: date) == searchingDate {
                result.append(reminder)
            }
        }
        return result
    }
    
    func addReminder(reminder: ReminderStruct) {
        repository.saveReminder(reminder: reminder)
    }
}
