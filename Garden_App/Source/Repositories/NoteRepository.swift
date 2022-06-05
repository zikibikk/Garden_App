//
//  NoteRepository.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 04.06.2022.
//

//import Foundation
//
//protocol INoteRepository {
//    func saveNote(note: NoteStruct)
//    func getNotes(completion: @escaping ([NoteStruct]) -> Void)
//    func fetchNotes(completion: @escaping ([NoteStruct]) -> Void)
//}
//
//class NoteRepository: INoteRepository {
//
//    private let coreDataService: CoreDataService
//
//    init(coreDataService: CoreDataService) {
//        self.coreDataService = coreDataService
//    }
//
//    func getNotes(completion: @escaping ([NoteStruct]) -> Void) {
//        let fetchRequest = NoteEntity.noteFetchRequest()
//        coreDataService.fetch(fetchRequest) { notesEntities in
//            completion(notesEntities?.map { NoteStruct(noteEntity: $0) } ?? [])
//        }
//    }
//
//    func saveNote(note: NoteStruct) {
//        let fetchReq = NoteEntity.noteFetchRequest()
//
//        coreDataService.fetch(fetchReq) { [weak self] notesEntities in
//            guard let self = self, notesEntities?.first == nil else { return }
//            self.coreDataService.contextProvider { context in
//                let id = Int.random(in: 1...1_000_000)
//                let noteEntity = NoteEntity(id: self.coreDataService.getAvailableId(initialId: id, for: NoteEntity.self),
//                                            date: note.noteDate,
//                                            text: note.noteText,
//                                            context: context)
//            }
//        }
//    }
//
//    func fetchNotes(completion: @escaping ([NoteStruct]) -> Void) {
//        let fetchRequest = NoteEntity.noteFetchRequest()
//        coreDataService.fetch(fetchRequest) { notesEntities in
//            completion(notesEntities?.map {
//                NoteStruct(id: $0.id,
//                           noteDate: $0.noteDate,
//                           noteText: $0.noteText,
//                           noteTags: $0.noteTags)
//            } ?? [])
//        }
//    }
//}
//
//
////        return [.init(noteDate: Date(timeIntervalSince1970: 1646414107), noteText: "Высадила семена томата в стаканчики. Очень долго шли из Самары, и теперь надо успеть до конца следующей недели вырастить крепкие саженцы: погоду обещают хорошую, снег быстрее растает - дороги быстрее высохнут, мама захочет пораньше поехать на дачу, и мы опять застрянем в той яме. ", noteName: nil, noteTags: nil)]
//
