//
//  dayPresenter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 08.04.2022.
//

import Foundation

class DayPresenter {
    
    weak var dayView: DayViewController?
    private let notesSrv: NotesService
    private let advSrv: AdviceService
    
    init() {
        self.notesSrv = NotesService()
        self.advSrv = AdviceService()
    }
    
    func initialize() {
        dayView?.infoView.text = advSrv.getAdviceFromSite()
        dayView?.dateLabel.text = "Сегодня, 6 марта"
    }
}
