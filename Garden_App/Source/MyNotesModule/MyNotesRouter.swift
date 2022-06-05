//
//  MyNotesRouter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation
import UIKit

class MyNotesRouter: INotesRouter {
    weak var view: UIViewController?
    
    func openNoteVC(date: Date, notesService: INotesService) {
        let presenter = NotePresenter(noteDate: date, notesService: notesService)
        let vc = NoteViewController(presenter: presenter)
        presenter.view = vc

        view?.navigationController?.pushViewController(vc, animated: true)
        print("пытаюсь открыть..")
    }
}
