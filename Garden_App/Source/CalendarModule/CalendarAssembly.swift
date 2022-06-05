//
//  CalendarAssembly.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 03.06.2022.
//

import Foundation
import UIKit

enum CalendarAssembly {
    static func assemble() -> UIViewController {
        let noteRouter = PreviousDayRouter()
        let router = CalendarRouter()
        let dateService = DateService()
        let coreDataService = CoreDataService()
        let reminderRepository = ReminderRepository(coreDataService: coreDataService)
        let remindersService = ReminderService(repository: reminderRepository)
        let noteRepository = SimpleNoteRepository(coreDataService: coreDataService)
        let notesService = NotesService(repository: noteRepository, dateService: dateService)
        let presenter = CalendarPresenter(router: router, noteRouter: noteRouter, notesService: notesService, remindersService: remindersService)
        let calendarVC = CalendarViewController(presenter: presenter)
        let calendarNavVC = UINavigationController()
        calendarNavVC.viewControllers = [calendarVC]
        router.view = calendarVC
        return calendarNavVC
    }
}
