//
//  dayPresenter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 08.04.2022.
//
import SnapKit
import FittedSheets

class DayPresenter {
    weak var dayView: DayViewController?
    var noteVC: NoteViewController?
    private let notesSrv: NotesService
    private let advSrv: AdviceService
    private let currentDateTS = Date(timeIntervalSince1970: 1646586907)
    
    init() {
        self.notesSrv = NotesService()
        self.advSrv = AdviceService()
    }
    
    func initializeDayVC() {
        dayView?.infoView.text = advSrv.getAdviceFromSite()
        dayView?.dateLabel.text = "Сегодня, 6 марта"
    }
    
    func initializeNoteVC() {
        let note = notesSrv.getNoteByDate(date: currentDateTS)
        noteVC?.noteView.text = note?.noteText
        noteVC?.dateLabel.text = notesSrv.getDate(date: currentDateTS)
    }
    
    func showNoteScreen() {
        print("Notes")
        noteVC = NoteViewController(presenter: self)
        dayView?.navigationController?.pushViewController(noteVC!, animated: true)
    }
    
    func showReminderScreen() {
        print("reminder")
        let addReminderController = AddReminderController()
        let sheetController = SheetViewController(controller: addReminderController, sizes: [.intrinsic])
        dayView?.present(sheetController, animated: true)
    }
}
