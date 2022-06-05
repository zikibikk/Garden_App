//
//  CalendarRouter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 03.06.2022.
//

import Foundation
import UIKit

class CalendarRouter: ICalendarRouter {
    weak var view: UIViewController?
    
    func openDayVC(router: INoteRouter, date: Date, notesService: INotesService, remidersService: IReminderService) {
        let presenter = PreviousDayPresenter(router: router, date: date, notesService: notesService, remindersService: remidersService)
        let vc = PreviousDayViewController(presenter: presenter)
        presenter.view = vc
        
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
