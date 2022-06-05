//
//  CalendarModule.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 05.06.2022.
//

import Foundation

protocol CalendarOtput: AnyObject {
    func viewDidSelect(date: Date)
}

protocol ICalendarRouter {
    func openDayVC(router: INoteRouter, date: Date, notesService: INotesService, remidersService: IReminderService)
}
