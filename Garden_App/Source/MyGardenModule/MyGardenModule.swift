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
    func viewDidSelect(plant: PlantStruct)
    func savePlant(plant: PlantStruct)
}

// TODO: (r.akhmadeev) IMyGardenRouter
protocol IGardenRouter {
    // TODO: (r.akhmadeev) router и сервисы передавать не надо
    func openPlantVC(plant: PlantStruct, router: IDayRouter, notesService: INotesService, reminderService: IReminderService)
}
