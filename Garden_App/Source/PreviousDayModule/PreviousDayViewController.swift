//
//  NoteViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 24.04.2022.
//

import SnapKit

class PreviousDayViewController: UIViewController {
    private let reminders: [ReminderStruct] = []
    private let presenter: PreviousDayOutput
    private let dateService = DateService()
    private lazy var verticalView: UIStackView = {
        let hv = UIStackView()
        hv.axis = .vertical
        hv.spacing = 30
        return hv
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        return tableView
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .title
        return label
    }()
    
    lazy var adviceView = GreenView()
    lazy var noteStatus: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.text = "Заметка"
        return label
    }()
    
    lazy var noteView: GreenView = {
        let gv = GreenView()
        gv.makeLightBackground()
        return gv
    }()
    
    lazy var reminderStatus: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.text = "Напоминаний нет"
        return label
    }()
    
    init(presenter: PreviousDayOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter.viewDidLoad()
    }
}

extension PreviousDayViewController {
    func initialize () {
        view.addSubview(verticalView)
        view.backgroundColor = .white
        verticalView.addArrangedSubview(dateLabel)
        verticalView.addArrangedSubview(adviceView)
        verticalView.addArrangedSubview(noteStatus)
        verticalView.addArrangedSubview(noteView)
        verticalView.addArrangedSubview(reminderStatus)
        
        verticalView.snp.makeConstraints { maker in
            maker.right
                .left
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalToSuperview().inset(60)
        }
    }
}

extension PreviousDayViewController: PreviousDayInput {
    func getPreviousDay(date: Date, note: NoteStruct?, reminders: [ReminderStruct]) {
        self.title = dateService.getDate(date: date)
        self.noteView.text = note?.noteText
        if note?.noteText == nil {
            noteView.text = "                Заметки на этот день нет"
        }
        
        if reminders.count != 0 {
            reminderStatus.text = "Напоминания"
        }
    }
}

extension PreviousDayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) 
        return cell
    }
}
