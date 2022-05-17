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
    
    init() {
        self.repo = Repository()
    }
}

extension NotesService: SaveNoteDelegate {
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

extension NotesService {
    func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        return dateFormatter.string(from: date)
    }
}

extension NotesService {
    func getDateWithYear(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        return dateFormatter.string(from: date)
    }
}
