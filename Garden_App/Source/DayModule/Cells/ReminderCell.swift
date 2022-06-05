//
//  ReminderCell.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 05.06.2022.
//

import UIKit

class ReminderCell: UITableViewCell {
    
    private lazy var reminder: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(date: String, newTxt: String) {
        self.reminder.text = "\(date)   \(newTxt)"
    }
    
    private func setUpView() {
        self.selectionStyle = .none
        self.contentView.addSubview(reminder)
        
        reminder.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().inset(Constraints.side)
        }
    }
}
