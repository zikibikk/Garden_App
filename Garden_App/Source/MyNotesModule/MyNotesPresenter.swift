//
//  MyNotesPresenter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 05.06.2022.
//

import Foundation

class MyNotesPresenter: MyNotesOutput {
    weak var view: MyNotesInput?
    private let router: INotesRouter
    private let notesService: INotesService
    // TODO: (r.akhmadeev) Зачем это тут если не используется?
    private let coreDataService: CoreDataService
    
    init(router: INotesRouter, notesService: INotesService, coreDataService: CoreDataService) {
        self.router = router
        self.notesService = notesService
        self.coreDataService = coreDataService
    }
    
    func viewDidLoad() {
        view?.getNotes(notes: notesService.getAllNotes()!)
    }
    
    func viewDidSelect(date: Date) {
        router.openNoteVC(date: date, notesService: notesService)
    }
}
