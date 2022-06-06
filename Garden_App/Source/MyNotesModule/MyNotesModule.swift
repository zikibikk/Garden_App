//
//  MyNotesModule.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 05.06.2022.
//

import Foundation

protocol MyNotesInput: AnyObject {
    func getNotes(notes: [NoteStruct])
}

protocol MyNotesOutput: AnyObject {
    func viewDidLoad()
    func viewDidSelect(date: Date)
}

protocol INotesRouter {
    func openNoteVC(date: Date, notesService: INotesService)
}
