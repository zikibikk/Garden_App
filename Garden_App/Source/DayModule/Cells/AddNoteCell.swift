//
//  AddNoteCell.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 05.06.2022.
//

import UIKit

class AddNoteCell: UITableViewCell {
    
    private lazy var view = AddNoteView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        self.selectionStyle = .none
        self.contentView.addSubview(view)
        
        view.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().inset(Constraints.side)
        }
    }
}
