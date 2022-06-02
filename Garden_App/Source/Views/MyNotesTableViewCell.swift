//
//  MyNotesTableViewCell.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 11.05.2022.
//

import Foundation
import UIKit

extension DateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}

class MyNotesTableViewCell: UITableViewCell {
    
    private lazy var noteTextLabel = UILabel()
    private lazy var noteDateLabel = UILabel()
    private lazy var noteImageView = UIImageView(image: (UIImage(named: "bubbleNote")))
    
    private var dateF = DateFormatter(dateFormat: "dd.MM.yy")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        configureBubbleNote()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        contentView.addSubview(noteDateLabel)
        
        noteDateLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(93)
            make.width.equalTo(100)
        }
        noteDateLabel.font = .date
        noteDateLabel.textColor = .black
    }
    
    private func configureBubbleNote() {
        contentView.addSubview(noteImageView)
        contentView.addSubview(noteTextLabel)
        
        noteImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(27)
            make.top.equalToSuperview().inset(50)
            make.width.equalTo(270)
            make.height.equalTo(80)
        }
        noteImageView.image = noteImageView.image?.withRenderingMode(.alwaysTemplate)
        noteImageView.tintColor = .deepGreen
        
        noteTextLabel.snp.makeConstraints { make in
            make.top.bottom.right.equalTo(noteImageView).inset(14)
            make.left.equalTo(noteImageView).inset(25)
        }
        noteTextLabel.font = .bubbleNote
        noteTextLabel.backgroundColor = .clear
        noteTextLabel.textColor = .white
        noteTextLabel.numberOfLines = 2
    }
    
    func setData(data: NoteModel) {
        noteTextLabel.text = data.noteText
        noteDateLabel.text = dateF.string(from: data.noteDate)
    }
}
