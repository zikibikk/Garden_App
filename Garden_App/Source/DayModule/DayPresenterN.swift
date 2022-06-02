//
//  DayPresenter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.06.2022.
//

import Foundation

class DayPresenterN: DayOutput {

    weak var view: DayInput?
    
    private let router: IDayRouter
    private let adviceService: IAdviceService
    private let notesService: INotesService
    private let dateService: DateService
    private let reminderService: IReminderService

    init(router: IDayRouter, adviceService: IAdviceService, notesService: INotesService, dateService: DateService, reminderService: IReminderService) {
        self.router = router
        self.adviceService = adviceService
        self.notesService = notesService
        self.dateService = dateService
        self.reminderService = reminderService
    }
}

extension DayPresenterN {
    
    func viewDidLoad() {
        let currentDateTS = Date.init()
        
        view?.getInfo(advice: adviceService.getAdvice(),
                      title: dateService.getDate(date: currentDateTS),
                      note: notesService.getNoteByDate(date: currentDateTS))
    }
    
    func showNoteScreen() {
        router.openNoteVC(noteDate: Date.init(), notesService: notesService)
    }
    
    func showReminderScreen() {
        router.openReminderVC(reminderService: reminderService)
    }
}
