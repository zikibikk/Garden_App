//
//  ЗдфтеЫукмшсу.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 05.06.2022.
//

import Foundation

protocol IPlantService {
    func savePlant(plant: PlantStruct)
    func getPlants() -> [PlantStruct]?
    func addNote(plant: PlantStruct, note: NoteStruct)
    func addReminder(plant: PlantStruct, reminder: ReminderStruct)
    func addTag(plant: PlantStruct, tag: TagStruct)
}

class PlantService: IPlantService {
    
    private let repository: IPlantRepository
    
    init(repository: IPlantRepository) {
        self.repository = repository
    }
    
    func savePlant(plant: PlantStruct){
        repository.savePlant(plant: plant)
    }
    
    func getPlants() -> [PlantStruct]? {
        return repository.getPlants()
    }
    
    func addNote(plant: PlantStruct, note: NoteStruct) {
        repository.addNote(plant: plant, note: note)
    }
    
    func addReminder(plant: PlantStruct, reminder: ReminderStruct) {
        repository.addReminder(plant: plant, reminder: reminder)
    }
    
    func addTag(plant: PlantStruct, tag: TagStruct) {
        repository.addTag(plant: plant, tag: tag)
    }
}
