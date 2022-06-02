//
//  NotesService.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//

import Foundation

protocol INotesService: AnyObject {
    func saveNote(note: NoteStruct)
    func getNoteByDate(date: Date) -> NoteStruct?
}

class NotesService {
    private let repo: Repository
    
    init() {
        self.repo = Repository()
    }
}

extension NotesService: INotesService {
    func saveNote(note: NoteStruct) {
        repo.saveNoteToCD(note: note)
    }
}

extension NotesService {
    func getNoteByDate(date: Date) -> NoteStruct? {
        return repo.getAllNotes().filter({ note in
            note.noteDate == date
        }).first
    }
}
