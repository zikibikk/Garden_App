//
//  PlantModule.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation

// TODO: (r.akhmadeev) Опять же нейминг: Лучше использовать `PlantViewInput`/PlantViewControllerInput`
protocol PlantInput: AnyObject {
    func getPlant(plant: PlantStruct)
}

// TODO: (r.akhmadeev) Для чего протокол? Он же не используется никак.
// В контроллере у вас идет обращение к View напрямую, без данной абстракции
protocol PlantInputForReminderView: AnyObject {
    func getPlantReminders(plant: PlantStruct)
}

// TODO: (r.akhmadeev) Для чего протокол? Он же не используется никак.
// В контроллере у вас идет обращение к View напрямую, без данной абстракции
protocol PlantInputForNoteView: AnyObject {
    func getPlantNotes(plant: PlantStruct)
}

// TODO: (r.akhmadeev) нейминг: Лучше использовать `PlantViewOutput`/PlantViewControllerOutput`
// В других модулях писать об этом не буду, но там тоже лучше поправить
protocol PlantOutput: AnyObject {
    func viewDidLoad()
    func viewDidSelect(date: Date)
    func showReminderScreen()
    func showCreateNoteScreen()
}
