//
//  MyNotesAssembly.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation
import UIKit

enum MyNotesAssembly {
    static func assemble() -> UIViewController {
        let router = MyNotesRouter()
        let coreDataService = CoreDataService()
        let repository = SimpleNoteRepository(coreDataService: coreDataService)
        let dateService = DateService()
        let notesService = NotesService(repository: repository, dateService: dateService)
        let presenter = MyNotesPresenter(router: router, notesService: notesService, coreDataService: coreDataService)
        let myNotesVC = MyNotesViewController(presenter: presenter)
        let myNotesNavVC = UINavigationController()
        
        myNotesVC.navigationItem.title = "Заметки"
        myNotesNavVC.navigationBar.tintColor = .black
        myNotesNavVC.viewControllers = [myNotesVC]
        
        presenter.view = myNotesVC
        router.view = myNotesVC
        return myNotesNavVC
    }
}
