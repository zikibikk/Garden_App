//
//  dayPresenter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 08.04.2022.
//
import SnapKit
import FittedSheets
import CoreText
import Foundation

class DayPresenter {
    weak var dayView: DayViewController?
    var noteVC: NoteViewController?
    private let notesSrv: NotesService
    private let advSrv: AdviceService
    private var currentDateTS: Date
    private let currentNote: NoteStruct?
    
    init() {
        self.notesSrv = NotesService()
        self.advSrv = AdviceService()
        self.currentDateTS = Date.init()
        currentNote = notesSrv.getNoteByDate(date: currentDateTS)
    }
    
    func initializeDayVC() {
        dayView?.navigationController?.navigationBar.prefersLargeTitles = true
        dayView?.infoView.text = advSrv.getAdviceFromSite()
        dayView?.title = "Сегодня, " + notesSrv.getDate(date: currentDateTS)//"Сегодня, 6 марта"
    }
    
    func viewDidLoadDayVC() {
        if let note = notesSrv.getNoteByDate(date: currentDateTS) {
            let view = GreenView()
            view.text = note.noteText
            dayView?.noteView = view
            print("note exists")
        } else {
            dayView?.noteView = AddNoteView()
        }
    }
    
    func initializeNoteVC() {
        noteVC?.noteView.text = currentNote?.noteText
        noteVC?.dateLabel.text = notesSrv.getDate(date: currentDateTS)
        //noteVC?.tags = currentNote?.noteTags
    }
    
    func showNoteScreen() {
        print("Notes")
        noteVC = NoteViewController(presenter: self)
        dayView?.navigationController?.pushViewController(noteVC!, animated: true)
    }
    
    func showReminderScreen() {
        print("reminder")
        let addReminderController = AddReminderController()
        addReminderController.presenter = self
        let sheetController = SheetViewController(controller: addReminderController, sizes: [.intrinsic])
        dayView?.present(sheetController, animated: true)
    }
    
    func showRTagScreen() {
        print("tag")
        let addTagController = AddTagController()
        addTagController.presenter = self
        let sheetController = SheetViewController(controller: addTagController, sizes: [.intrinsic])
        dayView?.present(sheetController, animated: true)
    }
    
    func addReminder() {
        dayView?.dismiss(animated: true)
    }
    
    func addTag() {
        
    }
}
