//
//  DayViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//


import SnapKit
import UIKit

enum DayModel {
    case addNote
    case addReminder
    case advice(advice: String)
    case note(text: String)
    case reminder(date: String, newTxt: String)
}

class DayViewController: UIViewController, DayInput {
    
    private let presenter: DayOutput
    private var dayModels: [DayModel] = []
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.register(AdviceCell.self, forCellReuseIdentifier: "\(AdviceCell.self)")
        tableView.register(AddNoteCell.self, forCellReuseIdentifier: "\(AddNoteCell.self)")
        tableView.register(AddReminderCell.self, forCellReuseIdentifier: "\(AddReminderCell.self)")
        tableView.register(NoteCell.self, forCellReuseIdentifier: "\(NoteCell.self)")
        tableView.register(ReminderCell.self, forCellReuseIdentifier: "\(ReminderCell.self)")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init(presenter: DayOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

extension DayViewController {
    
    func show(title: String, models: [DayModel]) {
        self.title = title
        self.dayModels = models
        tableView.reloadData()
    }
}

extension DayViewController {
    private func initialize() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.title = ""
    }
}

extension DayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dayModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let curModel = dayModels[indexPath.row]
        switch curModel {
        case.advice(let advice):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(AdviceCell.self)", for: indexPath) as! AdviceCell
            cell.updateText(newTxt: advice)
            return cell
        case.addNote:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(AddNoteCell.self)", for: indexPath) as! AddNoteCell
            return cell
        case.addReminder:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(AddReminderCell.self)", for: indexPath) as! AddReminderCell
            return cell
        case .note(let text):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(NoteCell.self)", for: indexPath) as! NoteCell
            cell.setText(newTxt: text)
            return cell
        case .reminder(let date, let text):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ReminderCell.self)", for: indexPath) as! ReminderCell
            cell.setText(date: date, newTxt: text)
            return cell
        }
    }
}

extension DayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dayModels[indexPath.row]
        switch model {
        case .addNote:
            presenter.showNoteScreen()
        case .note:
            presenter.showNoteScreen()
        case .addReminder:
            presenter.showReminderScreen()
        default:
            break
        }
    }
}
