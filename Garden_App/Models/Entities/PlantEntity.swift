//
//  PlantEntity+CoreDataProperties.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//
//

import Foundation
import CoreData

@objc(PlantEntity)
public class PlantEntity: NSManagedObject {

}

extension PlantEntity {

    @nonobjc public class func plantFetchRequest() -> NSFetchRequest<PlantEntity> {
        return NSFetchRequest<PlantEntity>(entityName: "PlantEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var plantName: String
    @NSManaged public var plantTags: Set<TagEntity>?
    @NSManaged public var plantsReminders: Set<ReminderEntity>?
    @NSManaged public var plantNotes: Set<NoteEntity>?

    func setUp(plant: PlantStruct) {
        self.id = plant.id
        self.plantName = plant.plantName
    }
}

// MARK: Generated accessors for plantTags
extension PlantEntity {

    @objc(addPlantTagsObject:)
    @NSManaged public func addToPlantTags(_ value: TagEntity)

    @objc(removePlantTagsObject:)
    @NSManaged public func removeFromPlantTags(_ value: TagEntity)

    @objc(addPlantTags:)
    @NSManaged public func addToPlantTags(_ values: NSSet)

    @objc(removePlantTags:)
    @NSManaged public func removeFromPlantTags(_ values: NSSet)

}

// MARK: Generated accessors for plantReminders
extension PlantEntity {

    @objc(addPlantRemindersObject:)
    @NSManaged public func addToPlantReminders(_ value: ReminderEntity)

    @objc(removePlantRemindersObject:)
    @NSManaged public func removeFromPlantReminders(_ value: ReminderEntity)

    @objc(addPlantReminders:)
    @NSManaged public func addToPlantReminders(_ values: NSSet)

    @objc(removePlantReminders:)
    @NSManaged public func removeFromPlantReminders(_ values: NSSet)

}

extension PlantEntity : Identifiable {

}
