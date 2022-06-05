//
//  SimpleNoteRepository.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.06.2022.
//

import Foundation

protocol ISimpleNoteRepository {
    func saveNote(note: NoteStruct)
    func getNotes() -> [NoteStruct]?
    func addTag(note: NoteStruct, tag: TagStruct)
    func updateNote(note: NoteStruct, newText: String)
    func deleteNote(note: NoteStruct)
    func cearRepository()
}

class SimpleNoteRepository: ISimpleNoteRepository {
    
    private let coreDataService: CoreDataService
    
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }
    
    func saveNote(note: NoteStruct) {
        coreDataService.viewContext.perform { [weak self] in
            guard let context = self?.coreDataService.viewContext else { return }
            let noteEntity = NoteEntity(context: context)
            noteEntity.setUp(note: note)
            
            var tagsEntities = Set<TagEntity>()
            if let tags = note.noteTags{
                tags.forEach { tag in
                    let tagEntity = TagEntity(context: context)
                    tagEntity.setUp(tag: tag)
                    tagEntity.tagNote = noteEntity
                    tagsEntities.insert(tagEntity)
                }
                noteEntity.noteTags = tagsEntities
            }
            
            if let plant = note.notePlant {
                let plantEntity = PlantEntity(context: context)
                plantEntity.setUp(plant: plant)
                noteEntity.notePlant = plantEntity
            }
            
            do { try context.save() }
            catch let error { print("Error: \(error)") }
        }
    }
    
    func getNotes() -> [NoteStruct]? {
        var notes: [NoteStruct] = []
        let fetchRequest = NoteEntity.noteFetchRequest()
        
        do {
            let entities = try self.coreDataService.viewContext.fetch(fetchRequest)
            for entity in entities {
                let note = NoteStruct(noteEntity: entity)
                notes.append(note)
            }
        } catch let error {
            print("Error: \(error)")
        }
        return notes
    }
    
    func addTag(note: NoteStruct, tag: TagStruct) {
        coreDataService.viewContext.perform { [weak self] in
            guard let context = self?.coreDataService.viewContext else { return }
            let noteEntity = NoteEntity(context: context)
            noteEntity.setUp(note: note)
            if !(note.noteTags?.contains(tag) ?? true) {
                let tagEntity = TagEntity(context: context)
                tagEntity.setUp(tag: tag)
                tagEntity.tagNote = noteEntity
                noteEntity.noteTags?.insert(tagEntity)
            }
            do { try context.save() }
            catch let error { print("Error: \(error)") }
        }
    }
    
    func updateNote(note: NoteStruct, newText: String) {
        coreDataService.viewContext.perform { [weak self] in
            guard let context = self?.coreDataService.viewContext else { return }
            let fetchRequest = NoteEntity.noteFetchRequest()
        
            do {
                guard let entities = try self?.coreDataService.viewContext.fetch(fetchRequest)
                else {
                    self?.saveNote(note: note)
                    return
                }
                for entity in entities {
                    if (entity.id == note.id) {
                        entity.noteText = newText
                        try context.save()
                    }
                }
            } catch let error {
                print("Error: \(error)")
            }
        }
    }
    
    func deleteNote(note: NoteStruct) {
        coreDataService.viewContext.perform { [weak self] in
            guard let context = self?.coreDataService.viewContext else { return }
            let fetchRequest = NoteEntity.noteFetchRequest()
        
            do {
                guard let entities = try self?.coreDataService.viewContext.fetch(fetchRequest) else { return }
                for entity in entities {
                    if (entity.id == note.id) {
                        context.delete(entity)
                        try context.save()
                    }
                }
            } catch let error {
                print("Error: \(error)")
            }
        }
    }
    
    func cearRepository() {
        coreDataService.viewContext.perform { [weak self] in
            guard let context = self?.coreDataService.viewContext else { return }
            let fetchRequest = NoteEntity.noteFetchRequest()
        
            do {
                guard let entities = try self?.coreDataService.viewContext.fetch(fetchRequest) else { return }
                for entity in entities {
                    context.delete(entity)
                    try context.save()
                }
            } catch let error {
                print("Error: \(error)")
            }
        }
    }
}
