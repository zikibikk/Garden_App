//
//  MyGardenPresenter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 06.06.2022.
//

import Foundation
import UIKit

class MyGardenPresenter: MyGardenOutput {
    weak var view: MyGardenInput?
    
    private let dayRouter: IDayRouter
    private let notesService: INotesService
    private let remindersService: IReminderService
    private let router: IGardenRouter
    private let plantService: IPlantService
    
    init(dayRouter: IDayRouter, notesService: INotesService, remindersService: IReminderService, plantService: IPlantService, router: IGardenRouter) {
        self.dayRouter = dayRouter
        self.notesService = notesService
        self.remindersService = remindersService
        self.plantService = plantService
        self.router = router
    }
    
    func viewDidLoad() {
        view?.getPlants(plants: plantService.getPlants() ?? [])
    }
    
    func viewDidSelect(plantName: String) {
        router.openPlantVC(plant: plantService.getPlantByName(name: plantName)!, router: dayRouter, notesService: notesService, reminderService: remindersService, plantService: plantService)
    }
    
    func savePlant(plant: PlantStruct) {
        plantService.savePlant(plant: plant)
    }
}
