//
//  PlantAssembly.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 06.06.2022.
//

import Foundation
import UIKit

enum PlantAssembly {
    // TODO: (r.akhmadeev) По хорошему этот метод должен возвращать контроллер от модуля Plant без NavigationController
    // Это позволить более гибко использовать модуль в разных кейсах
    // Размещать модуль внутри NavigationController лучше в том месте, где хотите его отобразить (в роутере/апп делегате и тд)
    // Это правило справедливо и для других модулей, там повторять это не буду
    static func assemble() -> UIViewController {
        let coreDataService = CoreDataService()
        let dateService = DateService()
        let noteRepository = SimpleNoteRepository(coreDataService: coreDataService)
        let reminderRepository = ReminderRepository(coreDataService: coreDataService)
        let notesService = NotesService(repository: noteRepository, dateService: dateService)
        let router = PlantRouter()
        let plant = PlantStruct(plantName: "Пшеница", workDate: Date.distantPast, wateringDate: Date.distantPast, plantTags: nil, plantsNotes: nil)
        let reminderService = ReminderService(repository: reminderRepository, dateService: dateService)
        let presenter = PlantPresenter(plant: plant, router: router, notesService: notesService, reminderService: reminderService)
        let plantVC = PlantViewController(presenter: presenter)

        let plantNavVC = UINavigationController()

        plantNavVC.navigationBar.prefersLargeTitles = true
        // TODO: (r.akhmadeev) можно в 1 строчку: `let plantNC = UINavigationController(rootViewController: plantVC)`
        plantNavVC.viewControllers = [plantVC]
        
        presenter.view = plantVC
        router.view = plantVC
        
        return plantNavVC
    }
}
