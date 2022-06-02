//
//  DayAssembly.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 02.06.2022.
//

import Foundation
import UIKit

enum DayAssembly {
    static func assemble() -> UIViewController {
        
        let router = DayRouter()
        let adviceService = AdviceService()
        let notesService = NotesService()
        let dateService = DateService()
        let reminderService = ReminderService()
        
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
