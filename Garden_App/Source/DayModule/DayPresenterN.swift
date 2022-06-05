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
        let note = notesService.getNoteByDate(date: currentDateTS)
        
        view?.getInfo(advice: adviceService.getAdvice(),
                      title: dateService.getDate(date: currentDateTS),
                      note: note)
    }
    
    func showNoteScreen() {
        router.openNoteVC(noteDate: Date.init(), notesService: notesService)
    }
    
    func showReminderScreen() {
        router.openReminderVC(reminderService: reminderService)
    }
    
    func viewWillAppear() {
        let currentDateTS = Date.init()
        let note = notesService.getNoteByDate(date: currentDateTS)
        
        view?.updateNote(note: note)
        print("note recieved")
    }
    
}
