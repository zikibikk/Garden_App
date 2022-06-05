//
//  ReminderEntity+CoreDataProperties.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//
//

import Foundation
import CoreData

@objc(ReminderEntity)
public class ReminderEntity: NSManagedObject {

}

extension ReminderEntity {

    @nonobjc public class func remindFetchRequest() -> NSFetchRequest<ReminderEntity> {
        return NSFetchRequest<ReminderEntity>(entityName: "ReminderEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var reminderText: String
    @NSManaged public var reminderDate: Date
    @NSManaged public var remindersPlants: Set<PlantEntity>?

    
    func setUp(reminder: ReminderStruct) {
        self.id = reminder.id
        self.reminderText = reminder.reminderText
        self.reminderDate = reminder.reminderDate
    }
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
