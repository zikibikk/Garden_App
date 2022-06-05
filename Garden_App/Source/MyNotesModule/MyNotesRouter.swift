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
        let vc = NoteViewController(presenter: NotePresenter(noteDate: date, notesService: NotesService()))
        view?.navigationController?.pushViewController(vc, animated: true)
        print("ssfhjhfsshj")
    }
}
