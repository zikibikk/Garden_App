//
//  NoteEntity+CoreDataProperties.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 29.03.2022.
//
//

import Foundation
import CoreData


@objc(NoteEntity)
public class NoteEntity: NSManagedObject {

    @nonobjc public class func noteFetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var noteDate: Date
    @NSManaged public var noteText: String
    @NSManaged public var notePlant: PlantEntity?
    @NSManaged public var noteTags: Set<TagEntity>?
    
    func setUp(note: NoteStruct) {
        self.id = note.id
        self.noteDate = note.noteDate
        self.noteText = note.noteText
    }
    
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
