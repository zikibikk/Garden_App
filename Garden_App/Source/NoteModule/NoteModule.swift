//
//  NoteModule.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.06.2022.
//

import Foundation

protocol NoteInput: AnyObject {
    func getNote(note: NoteStruct?)
}

protocol NoteOutput: AnyObject {
    func viewDidLoad()
    func saveNote(note: NoteStruct)
}
