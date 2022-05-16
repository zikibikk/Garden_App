//
//  CalendarView.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 02.04.2022.
//

import UIKit
import SnapKit
import FSCalendar

class CalendarViewController: UIViewController {
    private lazy var tableView = UITableView()
    private let paginator = CalendarPaginationService()
    private var months = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStartMonths()
        configureView()
    }
    
    private func configureStartMonths() {
        let date = Date()
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: date)
        for month in currentMonth...12 {
            var dateComponents = DateComponents()
            dateComponents.year = 2022
            dateComponents.month = month
            guard let date = Calendar.current.date(from: dateComponents) else { return }
            months.append(date)
        }
    }
    
    private func configureView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: "CalendarTableViewCell")
        tableView.separatorStyle = .none
    }
}

extension CalendarViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        months.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CalendarTableViewCell", for: indexPath) as! CalendarTableViewCell
        cell.setMonth(date: months[indexPath.row])
        return cell
    }
}

extension CalendarViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height) {
            months.append(contentsOf: paginator.fetchData())
            tableView.reloadData()
        }
    }
}
