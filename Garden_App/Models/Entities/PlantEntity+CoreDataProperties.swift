//
//  PlantEntity+CoreDataProperties.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//
//

import Foundation
import CoreData


extension PlantEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlantEntity> {
        return NSFetchRequest<PlantEntity>(entityName: "PlantEntity")
    }

    @NSManaged public var plantDate: Date?
    @NSManaged public var plantName: String
    @NSManaged public var plantTags: Set<TagEntity>?
    @NSManaged public var plantsReminders: Set<ReminderEntity>?

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
