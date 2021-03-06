//
//  TagEntity+CoreDataProperties.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 29.03.2022.
//
//

import Foundation
import CoreData

@objc(TagEntity)
public class TagEntity: NSManagedObject {

}

extension TagEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TagEntity> {
        return NSFetchRequest<TagEntity>(entityName: "TagEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var tagColor: String?
    @NSManaged public var tagText: String
    @NSManaged public var tagNote: NoteEntity?
    @NSManaged public var tagPlant: PlantEntity?
    
    func setUp(tag: TagStruct) {
        self.id = tag.id
        self.tagText = tag.tagText
        self.tagColor = tag.tagColor
    }
}

extension TagEntity : Identifiable {

}
