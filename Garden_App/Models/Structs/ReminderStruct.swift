//
//  ReminderStruct.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//

import Foundation
struct ReminderStruct: Hashable {
    let id: Int32
    let reminderText: String
    let reminderDate: Date
    var remindersPlants: Set<PlantEntity>?
    
    init(id: Int = Int.random(in: 1...1_000_000),
         reminderText: String,
         reminderDate: Date) {
        self.id = Int32(id)
        self.reminderText = reminderText
        self.reminderDate = reminderDate
    }
    
    init(reminderEntity: ReminderEntity) {
        self.id = reminderEntity.id
        self.reminderText = reminderEntity.reminderText
        self.reminderDate = reminderEntity.reminderDate
    }
    
    func setOfPlants(plantsEntities: Set<PlantEntity>?) -> Set<PlantStruct> {
        var reminderPlants = Set<PlantStruct>()
        plantsEntities?.forEach { plantEntity in
            var plant = PlantStruct(plantEntity: plantEntity)
            plant.plantsReminders?.insert(self)
            reminderPlants.insert(plant)
        }
        return reminderPlants
    }
}
