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
        var noteModel: DayModel
        let text = note?.noteText
        
        if text != nil && text != "" {
            noteModel = .note(text: text!)
        } else {
            noteModel = .addNote
        }
        
        var models: [DayModel] = []
        models.append(.advice(advice: adviceService.getAdvice()))
        models.append(noteModel)
        models.append(.addReminder)
        
        if let reminders = reminderService.getRemindersByDate(date: currentDateTS) {
            for reminder in reminders {
                models.append(.reminder(date: dateService.getTime(date: reminder.reminderDate),
                                        newTxt: reminder.reminderText))
            }
        }
        
        view?.show(title: dateService.getDate(date: currentDateTS), models: models)
        
        print("note recieved")
    }
    
}
