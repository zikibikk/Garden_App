//
//  PreviousDayPresenter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 05.06.2022.
//

import Foundation

class PreviousDayPresenter: PreviousDayOutput {
    weak var view: PreviousDayInput?
    private let router: INoteRouter
    private let date: Date
    private let notesService: INotesService
    private let remindersService: IReminderService
    
    init(router: INoteRouter, date: Date, notesService: INotesService, remindersService: IReminderService) {
        self.router = router
        self.date = date
        self.notesService = notesService
        self.remindersService = remindersService
    }
    
    func viewDidLoad() {
        view?.getPreviousDay(date: date, note: notesService.getNoteByDate(date: date), reminders: remindersService.getRemindersByDate(date: date) ?? [])
    }
    
    func viewDidSelect() {
        router.openNoteVC(noteDate: date, notesService: notesService)
    }
}
