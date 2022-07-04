//
//  DayAssembly.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 02.06.2022.
//

import Foundation
import UIKit

enum DayAssembly {
    // TODO: (r.akhmadeev) Лишние отступы сверху
    static func assemble() -> UIViewController {
        
        
        let router = DayRouter()
        let adviceService = AdviceService()
        let coreDataService = CoreDataService()
        let dateService = DateService()
        
        let noteRepository = SimpleNoteRepository(coreDataService: coreDataService)
        let reminderRepository = ReminderRepository(coreDataService: coreDataService)
        let notesService = NotesService(repository: noteRepository, dateService: dateService)
        let reminderService = ReminderService(repository: reminderRepository, dateService: dateService)
        
        let presenter = DayPresenterN(router: router, adviceService: adviceService, notesService: notesService, dateService: dateService, reminderService: reminderService)
        let dayView = DayViewController(presenter: presenter)
        
        let dayNavC = UINavigationController()
        dayNavC.isNavigationBarHidden = true
        dayNavC.viewControllers = [dayView]
        
        router.view = dayView
        presenter.view = dayView
        return dayNavC
    }
}
