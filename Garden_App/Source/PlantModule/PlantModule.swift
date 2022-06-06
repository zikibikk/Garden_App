//
//  PlantModule.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation

protocol PlantInput: AnyObject {
    func getPlant(plant: PlantStruct)
}

protocol PlantInputForReminderView: AnyObject {
    func getPlantReminders(plant: PlantStruct)
}

protocol PlantInputForNoteView: AnyObject {
    func getPlantNotes(plant: PlantStruct)
}

protocol PlantOutput: AnyObject {
    func viewDidLoad()
    func viewDidSelect(date: Date)
    func showReminderScreen()
    func showCreateNoteScreen()
}
