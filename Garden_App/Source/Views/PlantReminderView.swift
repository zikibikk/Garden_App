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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        return tableView
    }()
    
    private var reminders: [ReminderStruct] = []
    
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
            make.edges.equalToSuperview().inset(10)
        }
    }
}

extension PlantReminderView: PlantInput {
    func getPlant(plant: PlantStruct) {
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
        cell.textLabel?.text = reminder.reminderText
        return cell
    }
}
