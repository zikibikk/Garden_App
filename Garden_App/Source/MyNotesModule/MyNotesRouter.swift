//
//  MyNotesRouter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation
import UIKit

class MyNotesRouter {
    weak var view: UIViewController?
    
    func openNoteVC(date: Date) {
        let coreData = CoreDataService()
        let noteService = NotesService(
            repository: SimpleNoteRepository(coreDataService: coreData),
            dateService: DateService()
        )
        let presenter = NotePresenter(noteDate: date, notesService: noteService)
        let vc = NoteViewController(presenter: presenter)
        presenter.view = vc

        view?.navigationController?.pushViewController(vc, animated: true)
        print("ssfhjhfsshj")
    }
}
