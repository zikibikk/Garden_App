//
//  CalendarPresenter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 05.06.2022.
//

import Foundation

class CalendarPresenter: CalendarOtput {
    private let router: ICalendarRouter
    private let noteRouter: INoteRouter
    private let notesService: INotesService
    private let remindersService: IReminderService
    
    init(router: ICalendarRouter, noteRouter: INoteRouter, notesService: INotesService, remindersService: IReminderService) {
        self.router = router
        self.noteRouter = noteRouter
        self.notesService = notesService
        self.remindersService = remindersService
    }
    
    func viewDidSelect(date: Date) {
        router.openDayVC(router: noteRouter, date: date, notesService: notesService, remidersService: remindersService)
    }
}
