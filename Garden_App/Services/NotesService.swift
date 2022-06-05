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
    func getAllNotes() -> [NoteStruct]?
    func addTag(note: NoteStruct, tag: TagStruct)
    func updateNote(note: NoteStruct, newText: String)
    func deleteNote(note: NoteStruct)
}

class NotesService {
    private let repository: ISimpleNoteRepository
    private let dateService: DateService
    
    init(repository: ISimpleNoteRepository, dateService: DateService) {
        self.repository = repository
        self.dateService = dateService
    }
}

extension NotesService: INotesService {
    func deleteNote(note: NoteStruct) {
        repository.deleteNote(note: note)
    }
    
    func saveNote(note: NoteStruct) {
        repository.saveNote(note: note)
    }
    
    func getNoteByDate(date: Date) -> NoteStruct? {
        let searchingDate = dateService.getDateWithYear(date: date)
        let notes = repository.getNotes()
        guard let notes = notes else { return nil }
        var result: NoteStruct?
        for note in notes {
            if dateService.getDateWithYear(date: note.noteDate) == searchingDate {
                result = note
            }
        }
        return result
    }
    
    func getAllNotes() -> [NoteStruct]? {
        return repository.getNotes()
    }
    
    func addTag(note: NoteStruct, tag: TagStruct) {
        repository.addTag(note: note, tag: tag)
    }
    
    func updateNote(note: NoteStruct, newText: String) {
        if let note = getNoteByDate(date: note.noteDate) {
            repository.deleteNote(note: note)
        }
        if note.noteText != "" {
            repository.saveNote(note: note)
        }
        print(repository.getNotes()?.count)
    }
}
