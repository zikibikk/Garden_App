//
//  CalendarTableViewCell.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 15.04.2022.
//

import UIKit
import FSCalendar

class CalendarTableViewCell: UITableViewCell {
    private lazy var calendar = FSCalendar()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        configureCalendarSettings()
        configureAppearance()
        configureShadows()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMonth(date: Date) {
        calendar.currentPage = date
    }
    
    private func configureCalendarSettings() {
        calendar.scrollEnabled = false
        calendar.pagingEnabled = false
        calendar.placeholderType = .none
        calendar.firstWeekday = 2
        calendar.backgroundColor = .white
        calendar.layer.cornerRadius = 20
        selectionStyle = .none
    }
    
    private func configureAppearance() {
        self.calendar.appearance.headerMinimumDissolvedAlpha = 0.0;
        calendar.appearance.headerTitleFont = UIFont(name: "Roboto-Bold", size: 20)
        calendar.appearance.titleFont = UIFont(name: "SFProDisplay-Regular", size: 20)
        calendar.appearance.headerTitleOffset = CGPoint(x: -106, y: 0)
        calendar.appearance.headerTitleColor = UIColor.black
        calendar.appearance.weekdayTextColor = UIColor.black
        calendar.appearance.weekdayFont = UIFont(name: "Roboto-Bold", size: 15)
        calendar.appearance.todayColor = Colors.green
        calendar.appearance.caseOptions = [.headerUsesCapitalized,.weekdayUsesSingleUpperCase]
        calendar.appearance.headerDateFormat = "LLLL yyyy"
    }
    
    private func configureShadows() {
        calendar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        calendar.layer.shadowOpacity = 1
        calendar.layer.shadowRadius = 10
        calendar.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    private func configureLayout() {
        contentView.addSubview(calendar)
        calendar.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().inset(20)
            maker.height.equalTo(344)
        }
    }
}
