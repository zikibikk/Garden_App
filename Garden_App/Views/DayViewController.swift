//
//  DayViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//

import SnapKit

protocol AddNoteScreen {
    func addNote(note: NoteStruct)
}

class DayViewController: UIViewController {
    
    private lazy var dateLabel: UILabel = UILabel()
    private lazy var infoView: UIView = {
        let view = DeepGreenView()
        view.text = self.getAdviceDelegate?.getAdviceFromSite()
        return view
    }()
    private lazy var addNoteButton = AddNoteButton()
    private lazy var addReminderButton = AddReminderButton()
    weak var getAdviceDelegate: GetAdviceDelegate?
    weak var addNoteToCDDelegate: SaveNoteDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
}

extension DayViewController {
    
    private func initialize() {
        view.backgroundColor = .white
        view.addSubview(infoView)
        view.addSubview(addNoteButton)
        view.addSubview(addReminderButton)
        
        infoView.snp.makeConstraints { maker in
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalToSuperview().inset(100)
        }
        
        addNoteButton.snp.makeConstraints { maker in
            maker.right
                .left
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalTo(infoView.snp.bottom).offset(35)
        }
        
        addReminderButton.snp.makeConstraints { maker in
            maker.right
                .left
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalTo(addNoteButton.snp.bottom).offset(15)
        }
    }
}

extension DayViewController: AddNoteScreen {
    func addNote(note: NoteStruct) {
        addNoteToCDDelegate?.saveNote(note: note)
    }
}
