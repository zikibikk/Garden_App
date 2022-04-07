//
//  NotesService.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//

import Foundation

protocol SaveNoteDelegate: AnyObject {
    func saveNote(note: NoteStruct)
}

class NotesService {
    private let repo: Repository
    var persistableService: PersistableService
    var addNoteScreen: AddNoteScreen?
    
    init(persistableService: PersistableService, addNoteScreen: AddNoteScreen) {
        self.persistableService = persistableService
        self.addNoteScreen = addNoteScreen
        self.repo = Repository()
    }
}

extension NotesService: SaveNoteDelegate {
    func saveNote(note: NoteStruct) {
        repo.saveNoteToCD(note: note)
    }
}
