//
//  ReminderEntity+CoreDataProperties.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//
//

import Foundation
import CoreData


extension ReminderEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReminderEntity> {
        return NSFetchRequest<ReminderEntity>(entityName: "ReminderEntity")
    }

    @NSManaged public var reminderText: String
    @NSManaged public var reminderDate: Date
    @NSManaged public var remindersPlants: Set<PlantEntity>?

}

// MARK: Generated accessors for reminderPlants
extension ReminderEntity {

    @objc(addReminderPlantsObject:)
    @NSManaged public func addToReminderPlants(_ value: PlantEntity)

    @objc(removeReminderPlantsObject:)
    @NSManaged public func removeFromReminderPlants(_ value: PlantEntity)

    @objc(addReminderPlants:)
    @NSManaged public func addToReminderPlants(_ values: NSSet)

    @objc(removeReminderPlants:)
    @NSManaged public func removeFromReminderPlants(_ values: NSSet)

}

extension ReminderEntity : Identifiable {

}
