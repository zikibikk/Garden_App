//
//  PlantPresenter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation
import UIKit

final class PlantPresenter: PlantOutput {
    weak var view: PlantInput?
    private let plant: PlantStruct
    private let router: IDayRouter
    private let notesService: INotesService
    private let reminderService: IReminderService
    private let plantService: IPlantService
    
    init(plant: PlantStruct, router: IDayRouter, notesService: INotesService, reminderService: IReminderService, plantService: IPlantService) {
        self.plant = plant
        self.router = router
        self.notesService = notesService
        self.reminderService = reminderService
        self.plantService = plantService
    }
    
    func viewDidLoad() {
        view?.getPlant(plant: plantService.getPlantByName(name: plant.plantName)!)
    }
    
    func showReminderScreen() {
        router.openReminderVC(reminderService: reminderService)
    }
    
    func showCreateNoteScreen() {
        router.openNoteVC(noteDate: Date.init(), notesService: notesService)
    }
    
    func viewDidSelect(date: Date) {
        router.openNoteVC(noteDate: date, notesService: notesService)
    }
}
