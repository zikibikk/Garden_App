//
//  MyGardenTableViewCell.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 25.04.2022.
//

import Foundation
import UIKit

class MyGardenTableViewCell: UITableViewCell {
    private lazy var plantLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        contentView.addSubview(plantLabel)
        plantLabel.font = .text
        plantLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(28)
        }
    }
    
    func setData(data: String) {
        plantLabel.text = data
    }
}
