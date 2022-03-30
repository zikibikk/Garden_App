//
//  NoteEntity+CoreDataProperties.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 29.03.2022.
//
//

import Foundation
import CoreData


extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var noteDate: Date
    @NSManaged public var noteText: String
    @NSManaged public var noteName: String?
    @NSManaged public var noteTags: Set<TagEntity>?

}

// MARK: Generated accessors for noteTags
extension NoteEntity {

    @objc(addNoteTagsObject:)
    @NSManaged public func addToNoteTags(_ value: TagEntity)

    @objc(removeNoteTagsObject:)
    @NSManaged public func removeFromNoteTags(_ value: TagEntity)

    @objc(addNoteTags:)
    @NSManaged public func addToNoteTags(_ values: NSSet)

    @objc(removeNoteTags:)
    @NSManaged public func removeFromNoteTags(_ values: NSSet)

}

extension NoteEntity : Identifiable {

}
