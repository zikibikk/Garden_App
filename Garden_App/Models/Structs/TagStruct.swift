//
//  TagStruct.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//

import Foundation
struct TagStruct: Hashable {
    // TODO: (r.akhmadeev) функции помещаем под свойства
    static func == (lhs: TagStruct, rhs: TagStruct) -> Bool {
        return (lhs.id == rhs.id) && (lhs.tagPlant == rhs.tagPlant) && (lhs.tagNote == rhs.tagNote) && (lhs.tagColor == rhs.tagColor) && (lhs.tagText == rhs.tagText)
    }
    
    let id: Int32
    let tagColor: String?
    let tagText: String
    var tagNote: NoteStruct?
    var tagPlant: PlantStruct?
    
    init (id: Int = Int.random(in: 1...1_000_000),
          tagColor: String?,
          tagText: String,
          tagNote: NoteStruct?,
          tagPlant: PlantStruct?) {
        self.id = Int32(id)
        self.tagColor = tagColor
        self.tagText = tagText
        self.tagNote = tagNote
        self.tagPlant = tagPlant
    }
    
    init(tagEntity: TagEntity) {
        self.id = tagEntity.id
        self.tagColor = tagEntity.tagColor
        self.tagText = tagEntity.tagText
    }
}
