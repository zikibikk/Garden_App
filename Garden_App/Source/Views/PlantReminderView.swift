//
//  PlantDoubleView.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation
import UIKit

class PlantReminderView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 13, bottom: 0, right: 13)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        return tableView
    }()
    
    private let dateService = DateService()
    private var reminders: [ReminderStruct] = [ReminderStruct(reminderText: "мульчирование", reminderDate: Date(dateString: "10.06.22")),
                                               ReminderStruct(reminderText: "обрезка", reminderDate: Date(dateString: "19.6.22")),
                                               ReminderStruct(reminderText: "убрать листья", reminderDate: Date(dateString: "25.6.22"))]
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.right.left.bottom.equalToSuperview().inset(0)
        }
    }
}

extension PlantReminderView: PlantInputForReminderView {
    func getPlantReminders(plant: PlantStruct) {
        self.reminders = plant.plantsReminders.map {
            Array($0)
        } ?? []
    }
}

extension PlantReminderView: PlantViewSizeDelegate {
    func plantViewContentSize(_ view: UIView) {
        view.snp.updateConstraints { make in
            make.height.equalTo(tableView.contentSize)
        }
    }
}

extension PlantReminderView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)") else { return UITableViewCell() }
        let reminder = reminders[indexPath.row]
        cell.textLabel?.text = "\(dateService.getDate(date: reminder.reminderDate))   \(reminder.reminderText)"
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .deepGreen
        return cell
    }
}
