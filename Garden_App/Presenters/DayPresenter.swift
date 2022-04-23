//
//  dayPresenter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 08.04.2022.
//
import SnapKit

class DayPresenter {
    
    weak var dayView: DayViewController?
    private let notesSrv: NotesService
    private let advSrv: AdviceService
    
    init() {
        self.notesSrv = NotesService()
        self.advSrv = AdviceService()
    }
    
    func initialize() {
        dayView?.infoView.text = advSrv.getAdviceFromSite()
        dayView?.dateLabel.text = "Сегодня, 6 марта"
    }
    
    func showNoteScreen() {
        print("Notes")
    }
    
    func showReminderScreen() {
        print("reminder")
        let addReminderController = AddReminderController()
        dayView?.present(addReminderController, animated: true)
//        dayView?.view.addSubview(addReminderController)
////        addReminderController.snp.makeConstraints{ maker in
////            maker.top.equalTo(-1)
////        }
////        addReminderController.layoutIfNeeded()
//        addReminderController.snp.makeConstraints{ maker in
//            maker.top.equalTo(500)
//        }
//        UIView.animate(withDuration: 0.5, delay: 0.4, animations: {
//            addReminderController.layoutIfNeeded()
//        })
    }
}
