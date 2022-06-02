//
//  DayRouter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.06.2022.
//


import FittedSheets
import UIKit

class DayRouter: IDayRouter, IReminderRouter {
    
    weak var view: UIViewController?
    
    func openReminderVC(reminderService: IReminderService) {
        let addReminderController = AddReminderController(reminderService: reminderService)
        addReminderController.router = self
        let sheetController = SheetViewController(controller: addReminderController, sizes: [.intrinsic])
        view?.present(sheetController, animated: true)
    }
    
    func openNoteVC(noteDate: Date, notesService: INotesService) {
        let notePresenter = NotePresenter(noteDate: noteDate, notesService: notesService)
        let noteVC = NoteViewController(presenter: notePresenter)
        notePresenter.view = noteVC
        view?.navigationController?.pushViewController(noteVC, animated: true)
    }
    
    func closeReminderVC() {
        view?.dismiss(animated: true)
    }
}
