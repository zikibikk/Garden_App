//
//  PlantRepository.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 02.06.2022.
//

import Foundation

protocol IPlantRepository {
    func savePlant(plant: PlantStruct)
    func getPlants() -> [PlantStruct]?
    func deletePlant(id: Int32)
    func addNote(plant: PlantStruct, note: NoteStruct)
    func addReminder(plant: PlantStruct, reminder: ReminderStruct)
    func addTag(plant: PlantStruct, tag: TagStruct)
}

class PlantRepository: IPlantRepository {
    
    private let coreDataService: CoreDataService
    
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }
    
    func savePlant(plant: PlantStruct) {
        coreDataService.viewContext.perform { [weak self] in
            guard let context = self?.coreDataService.viewContext else { return }
            let plantEntity = PlantEntity(context: context)
            plantEntity.setUp(plant: plant)
            
            var tagsEntities = Set<TagEntity>()
            if let tags = plant.plantTags{
                tags.forEach { tag in
                    let tagEntity = TagEntity(context: context)
                    tagEntity.setUp(tag: tag)
                    tagEntity.tagPlant = plantEntity
                    tagsEntities.insert(tagEntity)
                }
            }
            plantEntity.plantTags = tagsEntities
            
            var remindersEntities = Set<ReminderEntity>()
            if let reminders = plant.plantsReminders{
                reminders.forEach { reminder in
                    let reminderEntity = ReminderEntity(context: context)
                    reminderEntity.setUp(reminder: reminder)
                    reminderEntity.remindersPlants?.insert(plantEntity)
                    remindersEntities.insert(reminderEntity)
                }
            }
            plantEntity.plantsReminders = remindersEntities
            
            var notesEntities = Set<NoteEntity>()
            if let notes = plant.plantsNotes{
                notes.forEach { note in
                    let noteEntity = NoteEntity(context: context)
                    noteEntity.setUp(note: note)
                    noteEntity.notePlant = plantEntity
                    notesEntities.insert(noteEntity)
                }
            }
            plantEntity.plantNotes = notesEntities
            
            do { try context.save() }
            catch let error { print("Error: \(error)") }
        }
    }
    
    func getPlants() -> [PlantStruct]? {
        var plants: [PlantStruct] = []
        let fetchRequest = PlantEntity.plantFetchRequest()
        
        do {
            let entities = try self.coreDataService.viewContext.fetch(fetchRequest)
            for entity in entities {
                let plant = PlantStruct(plantEntity: entity)
                plants.append(plant)
            }
        } catch let error {
            print("Error: \(error)")
        }
        return plants
    }
    
    func addNote(plant: PlantStruct, note: NoteStruct) {
        coreDataService.viewContext.perform { [weak self] in
            guard let context = self?.coreDataService.viewContext else { return }
            let plantEntity = PlantEntity(context: context)
            plantEntity.setUp(plant: plant)
            if !(plant.plantsNotes?.contains(note) ?? true) {
                let noteEntity = NoteEntity(context: context)
                noteEntity.setUp(note: note)
                noteEntity.notePlant = plantEntity
                plantEntity.plantNotes?.insert(noteEntity)
            }
            do { try context.save() }
            catch let error { print("Error: \(error)") }
        }
    }
    
    func addReminder(plant: PlantStruct, reminder: ReminderStruct) {
        coreDataService.viewContext.perform { [weak self] in
            guard let context = self?.coreDataService.viewContext else { return }
            let plantEntity = PlantEntity(context: context)
            plantEntity.setUp(plant: plant)
            if !(plant.plantsReminders?.contains(reminder) ?? true) {
                let reminderEntity = ReminderEntity(context: context)
                reminderEntity.setUp(reminder: reminder)
                reminderEntity.remindersPlants?.insert(plantEntity)
                plantEntity.plantsReminders?.insert(reminderEntity)
            }
            do { try context.save() }
            catch let error { print("Error: \(error)") }
        }
    }
    
    func addTag(plant: PlantStruct, tag: TagStruct) {
        coreDataService.viewContext.perform { [weak self] in
            guard let context = self?.coreDataService.viewContext else { return }
            let plantEntity = PlantEntity(context: context)
            plantEntity.setUp(plant: plant)
            if !(plant.plantTags?.contains(tag) ?? true) {
                let tagEntity = TagEntity(context: context)
                tagEntity.setUp(tag: tag)
                tagEntity.tagPlant = plantEntity
                plantEntity.plantTags?.insert(tagEntity)
            }
            do { try context.save() }
            catch let error { print("Error: \(error)") }
        }
    }
    
    func deletePlant(id: Int32) {
        
    }
}
