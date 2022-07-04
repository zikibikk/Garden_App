//
//  AdviceCell.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 05.06.2022.
//

import UIKit

// TODO: (r.akhmadeev) Красиво и четко) 
class AdviceCell: UITableViewCell {

    private lazy var greenView = GreenView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateText(newTxt: String) {
        self.greenView.text = newTxt
    }
    
    private func setUpView() {
        self.selectionStyle = .none
        self.contentView.addSubview(greenView)
        
        greenView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().inset(Constraints.side)
        }
    }

}
