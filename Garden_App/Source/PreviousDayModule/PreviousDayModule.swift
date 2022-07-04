//
//  PreviousDayModule.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 05.06.2022.
//

import Foundation

protocol PreviousDayInput: AnyObject {
    // TODO: (r.akhmadeev) `get` - не самое подходящее слово, поскольку не отражает конкретное действие,
    // которое должен совершить контроллер. Лучше поменять на show/present/update/updateWith
    func getPreviousDay(date: Date, note: NoteStruct?, reminders: [ReminderStruct])
}

protocol PreviousDayOutput: AnyObject {
    func viewDidLoad()
    // TODO: (r.akhmadeev) из названия метода не понятно, что конкретно было выбрано
    func viewDidSelect()
}
// TODO: Router принадлежит модулю PreviousDay, и название должно соответствовать
protocol INoteRouter {
    func openNoteVC(noteDate: Date, notesService: INotesService)
}
