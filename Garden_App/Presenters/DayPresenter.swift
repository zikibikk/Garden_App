//
//  dayPresenter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 08.04.2022.
//

import Foundation

class DayPresenter {
    
    let dayView: DayViewController
    private let notesSrv: NotesService
    private let advSrv: AdviceService
    
    init(dayView: DayViewController) {
        self.dayView = dayView
        self.notesSrv = NotesService(viewWithAddingNote: dayView)
        self.advSrv = AdviceService(viewWithAdv: dayView)
    }
}
