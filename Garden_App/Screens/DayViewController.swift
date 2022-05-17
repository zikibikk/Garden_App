//
//  DayViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//

import SnapKit

class DayViewController: UIViewController {
    lazy var infoView = GreenView()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .title
        return label
    }()
    
    private var presenter: DayPresenter
    private var isSelected = false
    lazy var noteView = UIView()
    //private lazy var addNoteButton = AddNoteView()
    private lazy var addReminderButton = AddReminderView()
    private lazy var noteGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addNote(_:)))
    private lazy var reminderGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addReminder(_:)))

    init(presenter: DayPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoadDayVC()
        initialize()
    }
}

extension DayViewController {
    private func initialize() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.isNavigationBarHidden = false
        
        view.backgroundColor = .white
        view.addSubview(dateLabel)
        view.addSubview(infoView)
        view.addSubview(noteView)
        view.addSubview(addReminderButton)
        presenter.initializeDayVC()
        navigationController?.title = ""
        
        noteView.addGestureRecognizer(noteGestureRecognizer)
        addReminderButton.addGestureRecognizer(reminderGestureRecognizer)
        
        dateLabel.snp.makeConstraints { maker in
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalToSuperview().inset(90)
        }
        
        infoView.snp.makeConstraints { maker in
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        noteView.snp.makeConstraints { maker in
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
            maker.top.equalTo(noteView.snp.bottom).offset(15)
        }
    }
}

extension DayViewController {
    @objc func addNote(_ sender:UITapGestureRecognizer) {
        presenter.showNoteScreen()
     }
}

extension DayViewController {
    @objc func addReminder(_ sender:UITapGestureRecognizer) {
        presenter.showReminderScreen()
     }
}
