//
//  DaylyRemindersTableViewCell.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 06.06.2022.
//

import Foundation
import UIKit
import SnapKit

class DailyRemindersTableViewCell: UITableViewCell {
    private lazy var timeLabel = UILabel()
    private lazy var reminderlabel = UILabel()
    private lazy var timeAuraView = UIView()
    private let dateService = DateService()
    private let colorService = ColorService()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        contentView.addSubview(timeAuraView)
        contentView.addSubview(timeLabel)
        contentView.addSubview(reminderlabel)
        
        timeAuraView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(69)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.left.equalTo(timeAuraView.snp_leftMargin).inset(3)
            make.top.equalTo(timeAuraView.snp_topMargin).inset(2)
        }
        
        reminderlabel.snp.makeConstraints { make in
            make.leading.equalTo(timeAuraView.snp_trailingMargin).inset(-40)
            make.top.bottom.equalToSuperview().inset(20)
        }
        
        timeAuraView.layer.cornerRadius = 20
        timeAuraView.layer.borderWidth = 2
        timeAuraView.layer.borderColor = colorService.generateRandomPastelColor(withMixedColor: .white).cgColor
        
        timeLabel.font = .date
        reminderlabel.font = .text
    }
    
    func setData(data: ReminderStruct) {
        timeLabel.text = dateService.getTime(date: data.reminderDate)
        reminderlabel.text = data.reminderText
    }
    
    func setText(date: String, newTxt: String) {
        timeLabel.text = date
        reminderlabel.text = newTxt
    }
}
