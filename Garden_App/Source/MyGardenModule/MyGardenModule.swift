//
//  MyGardenModule.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 06.06.2022.
//

import Foundation

protocol MyGardenInput: AnyObject {
    func getPlants(plants: [PlantStruct])
}

protocol MyGardenOutput: AnyObject {
    func viewDidLoad()
    func viewDidSelect(plantName: String)
    func savePlant(plant: PlantStruct)
}

protocol IGardenRouter {
    func openPlantVC(plant: PlantStruct, router: IDayRouter, notesService: INotesService, reminderService: IReminderService, plantService: IPlantService)
}
