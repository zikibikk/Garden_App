//
//  PlantRouter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 06.06.2022.
//

import Foundation
import UIKit
import FittedSheets

// TODO: (r.akhmadeev) Лучше объединить 2 протокола в 1 и назвать IPlantRouter/PlantRouterProtocol/PlantRoutable и тд
class PlantRouter: IDayRouter, IReminderRouter {
    weak var view: UIViewController?
    
    func openReminderVC(reminderService: IReminderService) {
        let addReminderController = AddReminderController(reminderService: reminderService)
        addReminderController.router = self
        let sheetController = SheetViewController(controller: addReminderController, sizes: [.intrinsic])
        view?.present(sheetController, animated: true)
    }
    
    func openNoteVC(noteDate: Date, notesService: INotesService) {
        let presenter = NotePresenter(noteDate: noteDate, notesService: notesService)
        let noteVC = NoteViewController(presenter: presenter)
        presenter.view = noteVC
        view?.navigationController?.pushViewController(noteVC, animated: true)
    }
    
    func closeReminderVC() {
        view?.dismiss(animated: true)
    }
}
