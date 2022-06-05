//
//  NoteStruct.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//
import Foundation

struct NoteStruct: Hashable {
    let id: Int32
    let noteDate: Date
    let noteText: String
    var notePlant: PlantStruct?
    var noteTags: Set<TagStruct>?
    
    init(id: Int = Int.random(in: 1...1_000_000),
         noteDate: Date,
         noteText: String,
         notePlant: PlantStruct?,
         noteTags: Set<TagStruct>?) {
        self.id = Int32(id)
        self.noteTags = noteTags
        self.noteText = noteText
        self.notePlant = notePlant
        self.noteDate = noteDate
    }
    
    init(noteEntity: NoteEntity) {
        self.id = noteEntity.id
        self.noteDate = noteEntity.noteDate
        self.noteText = noteEntity.noteText
        self.noteTags = setOfTags(tagsEntities: noteEntity.noteTags)
    }
    
    private func setOfTags(tagsEntities: Set<TagEntity>?) -> Set<TagStruct> {
        var noteTags = Set<TagStruct>()
        tagsEntities?.forEach { tagEntity in
            var tag = TagStruct(tagEntity: tagEntity)
            tag.tagNote = self
            noteTags.insert(tag)
        }
        return noteTags
    }
}
