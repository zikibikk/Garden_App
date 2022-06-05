//
//  PreviousDayModule.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 05.06.2022.
//

import Foundation

protocol PreviousDayInput: AnyObject {
    func getPreviousDay(date: Date, note: NoteStruct?, reminders: [ReminderStruct])
}

protocol PreviousDayOutput: AnyObject {
    func viewDidLoad()
    func viewDidSelect()
}

protocol INoteRouter {
    func openNoteVC(noteDate: Date, notesService: INotesService)
}
