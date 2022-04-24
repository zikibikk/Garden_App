//
//  NoteStruct.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//
import Foundation

struct NoteStruct {
    let noteDate: Date
    let noteText: String
    let noteName: String?
    let noteTags: Set<TagEntity>?
}
