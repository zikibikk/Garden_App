//
//  DayViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//

import SnapKit
import UIKit

class DayViewController: UIViewController {
    lazy var infoView = GreenView()
    
    private var presenter: DayPresenter
    private var isSelected = false
    lazy var noteView = UIView()
    private lazy var scrollView = UIScrollView()
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
        scrollView.alwaysBounceVertical = true
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(infoView)
        scrollView.addSubview(noteView)
        scrollView.addSubview(addReminderButton)
        presenter.initializeDayVC()
        navigationController?.title = ""
        
        noteView.addGestureRecognizer(noteGestureRecognizer)
        addReminderButton.addGestureRecognizer(reminderGestureRecognizer)
        
        scrollView.snp.makeConstraints { maker in
            maker.left
                .equalToSuperview()
                .inset(Constraints.side)
            maker.right
                .equalTo(view.safeAreaLayoutGuide.snp.right)
                .inset(Constraints.side)
            maker.width
                .equalTo(view.safeAreaLayoutGuide.snp.width)
                .inset(Constraints.side)
            maker.top
                .equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        infoView.snp.makeConstraints { maker in
            maker.right
                .left
                .equalToSuperview()
            maker.top.equalToSuperview()
        }
        
        noteView.snp.makeConstraints { maker in
            maker.right
                .left
                .equalToSuperview()
            maker.width.equalToSuperview()
            maker.top.equalTo(infoView.snp.bottom).offset(35)
        }
        
        addReminderButton.snp.makeConstraints { maker in
            maker.right
                .left
                .equalToSuperview()
            maker.width.equalToSuperview()
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
