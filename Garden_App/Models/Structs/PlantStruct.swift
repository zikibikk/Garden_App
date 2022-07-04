//
//  PlantStruct.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//

import Foundation
struct PlantStruct: Hashable {
    // TODO: (r.akhmadeev) функции помещаем под свойства
    static func == (lhs: PlantStruct, rhs: PlantStruct) -> Bool {
        return lhs.plantTags == rhs.plantTags && lhs.plantsNotes == rhs.plantsNotes
        && lhs.plantsReminders==rhs.plantsReminders
    }
    
    let id: Int32
    let plantName: String
    let workDate: Date
    let wateringDate: Date
    var plantTags: Set<TagStruct>?
    var plantsReminders: Set<ReminderStruct>?
    var plantsNotes: Set<NoteStruct>?
    
    init(id: Int = Int.random(in: 1...1_000_000),
         plantName: String,
         workDate: Date,
         wateringDate: Date,
         plantTags: Set<TagStruct>?,
         plantsNotes: Set<NoteStruct>?) {
        self.id = Int32(id)
        self.plantName = plantName
        self.workDate = workDate
        self.wateringDate = wateringDate
        self.plantTags =  plantTags
        self.plantsNotes = plantsNotes
    }
    
    init(plantEntity: PlantEntity) {
        self.id = plantEntity.id
        self.plantName = plantEntity.plantName
        self.workDate = plantEntity.workDate
        self.wateringDate = plantEntity.wateringDate
        self.plantTags = setOfTags(tagsEntities: plantEntity.plantTags)
        self.plantsNotes = setOfNotes(notesEntities: plantEntity.plantNotes)
    }
    
    private func setOfTags(tagsEntities: Set<TagEntity>?) -> Set<TagStruct> {
        var plantTags = Set<TagStruct>()
        tagsEntities?.forEach { tagEntity in
            var tag = TagStruct(tagEntity: tagEntity)
            tag.tagPlant = self
            plantTags.insert(tag)
        }
        return plantTags
    }
    
    private func setOfNotes(notesEntities: Set<NoteEntity>?) -> Set<NoteStruct> {
        var plantNotes = Set<NoteStruct>()
        notesEntities?.forEach { noteEntity in
            var note = NoteStruct(noteEntity: noteEntity)
            note.notePlant = self
            plantNotes.insert(note)
        }
        return plantNotes
    }
}
