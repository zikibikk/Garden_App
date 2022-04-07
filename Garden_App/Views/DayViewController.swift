//
//  DayViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//

import SnapKit

class DayViewController: UIViewController {
    
    private lazy var dateLabel: UILabel = UILabel()
    private lazy var infoView: UIView = {
        let view = DeepGreenView()
        view.text = advService.getAdviceFromSite()
        return view
    }()
    private lazy var addNoteButton: UIButton = AddNoteButton()
    private lazy var addReminderButton = UIButton()
    var advService = AdviceService()

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
        
        infoView.snp.makeConstraints { maker in
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalToSuperview().inset(100)
        }
        
        addNoteButton.snp.makeConstraints {maker in
            maker.right
                .left
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalTo(infoView.snp.bottom).offset(35)
        }    }
}
