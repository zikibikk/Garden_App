//
//  MyGardenAssembly.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation
import UIKit

enum MyGardenAsssembly {
    static func assemble() -> UIViewController {
        let coreDataService = CoreDataService()
        let dayRouter = DayRouter()
        let noteRepository = SimpleNoteRepository(coreDataService: coreDataService)
        let reminderRepository = ReminderRepository(coreDataService: coreDataService)
        let dateService = DateService()
        let notesService = NotesService(repository: noteRepository, dateService: dateService)
        let remindersService = ReminderService(repository: reminderRepository, dateService: dateService)
        let router = MyGardenRouter()
        let plantRepository = PlantRepository(coreDataService: coreDataService)
        let plantService = PlantService(repository: plantRepository)
        let presenter = MyGardenPresenter(dayRouter: dayRouter, notesService: notesService, remindersService: remindersService, plantService: plantService, router: router)
        let myGardenVC = MyGardenViewController(presenter: presenter)
        let myGardenNavVC = UINavigationController()
        
        myGardenVC.navigationItem.largeTitleDisplayMode = .always
        myGardenVC.navigationItem.title = "Мой сад"
        myGardenNavVC.isNavigationBarHidden = false
        myGardenNavVC.navigationBar.prefersLargeTitles = true
        myGardenNavVC.navigationBar.barTintColor = UIColor(red: 231/255, green: 240/255, blue: 231/255, alpha: 5)
        myGardenNavVC.viewControllers = [myGardenVC]
        
        return myGardenNavVC
    }
}
