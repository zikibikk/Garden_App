//
//  PreviousDayRouter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 05.06.2022.
//

import Foundation
import UIKit

// TODO: (r.akhmadeev) Расхождение в названиях класса и протокола
class PreviousDayRouter: INoteRouter {
    weak var view: UIViewController?
    
    func openNoteVC(noteDate: Date, notesService: INotesService) {
        let notePresenter = NotePresenter(noteDate: noteDate, notesService: notesService)
        let vc = NoteViewController(presenter: notePresenter)
        notePresenter.view = vc
        
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
