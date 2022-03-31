//
//  TagEntity+CoreDataProperties.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 29.03.2022.
//
//

import Foundation
import CoreData


extension TagEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TagEntity> {
        return NSFetchRequest<TagEntity>(entityName: "TagEntity")
    }

    @NSManaged public var tagColor: String?
    @NSManaged public var tagText: String
    @NSManaged public var tagNote: NoteEntity?
    @NSManaged public var tagPlant: PlantEntity?

}

extension TagEntity : Identifiable {

}
