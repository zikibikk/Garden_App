//
//  Repository.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 08.04.2022.
//

import Foundation
import CoreData

class Repository {
    
    func saveNoteToCD(note: NoteStruct) {
        print(note.noteText)
    }
    
    func getAllReminders() -> [ReminderStruct] {
        return [.init(reminderText: "Посадить Клён", reminderDate: Date(timeIntervalSince1970: 1659689576), remindersPlants: nil),
                .init(reminderText: "Полить клубнику", reminderDate: Date(timeIntervalSince1970: 1662367976), remindersPlants: nil)]
    }
    
}
