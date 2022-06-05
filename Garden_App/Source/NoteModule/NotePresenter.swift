//
//  NotePresenter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.06.2022.
//

import Foundation
import UIKit

class NotePresenter: NoteOutput {
    
    weak var view: NoteInput?
    private let noteDate: Date
    private let notesService: INotesService
    
    init(noteDate: Date, notesService: INotesService) {
        self.noteDate = noteDate
        self.notesService = notesService
    }
    
    func viewDidLoad() {
        view?.getNote(note: notesService.getNoteByDate(date: noteDate))
    }
    
    func saveNote(note: NoteStruct) {
        notesService.updateNote(note: note, newText: note.noteText)
    }
}
