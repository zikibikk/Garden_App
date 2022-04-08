//
//  CalendarView.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 02.04.2022.
//

import UIKit
import SnapKit
import FSCalendar

class CalendarView: UIViewController {
    fileprivate lazy var calendar: FSCalendar = {
        let calendar = FSCalendar()
        return calendar
    }()
    
    fileprivate lazy var tableView = UITableView.init(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLayout(with: CGSize())
        initialize()
        calendar.delegate = self
        calendar.dataSource = self
    }
}

extension CalendarView: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendar.snp.updateConstraints { maker in
            maker.height.equalTo(bounds.height)
        }
        view.layoutIfNeeded()
    }
}

extension CalendarView {
    
    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }

    private func initialize() {
        view.backgroundColor = .white
        calendar.scrollEnabled = false
        //calendar.pagingEnabled = false
        calendar.placeholderType = .none
        calendar.firstWeekday = 2
        self.calendar.appearance.headerMinimumDissolvedAlpha = 0.0;
        calendar.appearance.headerTitleFont = UIFont(name: "Roboto-Bold", size: 20)
        calendar.backgroundColor = .white
        calendar.layer.cornerRadius = 20
        let shadows = UIView()
        shadows.frame = calendar.frame
        shadows.clipsToBounds = false
        calendar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        calendar.layer.shadowOpacity = 1
        calendar.layer.shadowRadius = 60
        calendar.layer.shadowOffset = CGSize(width: 0, height: 10)
        calendar.layer.bounds = shadows.bounds
        calendar.layer.position = shadows.center
        calendar.appearance.titleFont = UIFont(name: "SFProDisplay-Regular", size: 20)
        calendar.appearance.headerTitleOffset = CGPoint(x: -106, y: 0)
        calendar.appearance.headerTitleColor = UIColor.black
        calendar.appearance.weekdayTextColor = UIColor.black
        calendar.appearance.weekdayFont = UIFont(name: "Roboto-Bold", size: 15)
        calendar.appearance.todayColor = Colors.green
        calendar.appearance.caseOptions = [.headerUsesCapitalized,.weekdayUsesSingleUpperCase]
        //calendar.clipsToBounds = true
        //calendar.appearance.headerDateFormat = "MMM yyyy"
        view.addSubview(shadows)
        view.addSubview(calendar)
        calendar.snp.makeConstraints{ maker in
           maker.left.right.equalToSuperview().inset(23)
           maker.top.equalToSuperview().inset(67)
           maker.bottom.equalToSuperview().inset(433)
           maker.height.width.equalTo(344)
        }
    }
}
