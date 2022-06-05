//
//  MyNotesTableViewCell.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 11.05.2022.
//

import Foundation
import UIKit

protocol MyNotesCellDelegate: AnyObject {
    func myNotesCell(_ cell: MyNotesTableViewCell, didSelect note: String, by date: Date)
}

class MyNotesTableViewCell: UITableViewCell {
    weak var delegate: MyNotesCellDelegate?
    private lazy var noteTextLabel = UILabel()
    private lazy var noteDateLabel = UILabel()
    private lazy var noteBubbleButton = UIButton()
    
    private let dateService = DateService()
    
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
        contentView.addSubview(noteBubbleButton)
        contentView.addSubview(noteTextLabel)
        
        noteBubbleButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(27)
            make.top.equalToSuperview().inset(50)
            make.width.equalTo(270)
            make.height.equalTo(80)
        }
        noteBubbleButton.addTarget(self, action: #selector(noteTapped), for: .touchUpInside)
        noteBubbleButton.setImage(UIImage(named: "bubbleNote")?.withRenderingMode(.alwaysTemplate), for: .normal)
        noteBubbleButton.tintColor = .deepGreen
        
        noteTextLabel.snp.makeConstraints { make in
            make.top.bottom.right.equalTo(noteBubbleButton).inset(14)
            make.left.equalTo(noteBubbleButton).inset(25)
        }
        noteTextLabel.font = .text
        noteTextLabel.backgroundColor = .clear
        noteTextLabel.textColor = .white
        noteTextLabel.numberOfLines = 2
    }
    
    func setData(data: NoteStruct) {
        noteTextLabel.text = data.noteText
        noteDateLabel.text = dateService.getDecimalDate(date: data.noteDate)
    }
    
    @objc func noteTapped() {
        delegate?.myNotesCell(self, didSelect: noteTextLabel.text!, by: Date(dateString: noteDateLabel.text!))
    }
}
