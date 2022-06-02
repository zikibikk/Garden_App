//
//  DayModule.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.06.2022.
//

import Foundation

protocol DayInput: AnyObject {
    func getInfo(advice: String, title: String, note: NoteStruct?)
}

protocol DayOutput: AnyObject {
    func viewDidLoad()
    func showNoteScreen()
    func showReminderScreen()
}

protocol IDayRouter: AnyObject {
    func openReminderVC(reminderService: IReminderService)
    func openNoteVC(noteDate: Date, notesService: INotesService)
}

protocol IReminderRouter: AnyObject {
    func closeReminderVC()
}
