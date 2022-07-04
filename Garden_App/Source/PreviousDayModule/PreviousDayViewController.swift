//
//  NoteViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 24.04.2022.
//

import SnapKit

class PreviousDayViewController: UIViewController {
    // TODO: (r.akhmadeev) Смысл от массива, если он пустой и неизменяемый? - В tableView всегда будут отсутствовать ячейки
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
        tableView.register(DailyRemindersTableViewCell.self, forCellReuseIdentifier: "\(DailyRemindersTableViewCell.self)")
        return tableView
    }()
    // TODO: (r.akhmadeev) private
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .title
        return label
    }()
    // TODO: (r.akhmadeev) private
    lazy var adviceView = GreenView()
    // TODO: (r.akhmadeev) private
    lazy var noteStatus: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.text = "Заметка"
        return label
    }()
    // TODO: (r.akhmadeev) private
    lazy var noteView: GreenView = {
        let gv = GreenView()
        gv.makeLightBackground()
        return gv
    }()
    // TODO: (r.akhmadeev) private
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
    // TODO: (r.akhmadeev) private
    // TODO: (r.akhmadeev) `initialize` - то, что происходит при init(). Здесь же идет конфигурация вью, поэтому лучше переименовать
    func initialize () {
        view.addSubview(verticalView)
        view.backgroundColor = .white
        verticalView.addArrangedSubview(dateLabel)
        verticalView.addArrangedSubview(adviceView)
        verticalView.addArrangedSubview(noteStatus)
        verticalView.addArrangedSubview(noteView)
        verticalView.addArrangedSubview(reminderStatus)
        view.addSubview(tableView)
    
        tableView.separatorColor = .lightGreen
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 13, bottom: 0, right: 13)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(verticalView.snp_bottomMargin).inset(-20)
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
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
        // TODO: (r.akhmadeev) dateService вынести в presenter
        self.title = dateService.getDate(date: date)
        self.noteView.text = note?.noteText
        if note?.noteText == nil {
            // TODO: (r.akhmadeev) Что такое? Если нужны отступы, то можно констрейнт для лейбла настроить
            noteView.text = "                Заметки на этот день нет"
        }

        // TODO: (r.akhmadeev) Лучше воспользоваться !reminders.isEmpty
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyRemindersTableViewCell", for: indexPath) as! DailyRemindersTableViewCell
        cell.setData(data: reminders[indexPath.row])
        return cell
    }
}
