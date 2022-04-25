//
//  MyGardenTableViewCell.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 25.04.2022.
//

import Foundation
import UIKit

class MyGardenTableViewCell: UITableViewCell {
    private lazy var exampleText = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(data: String) {
        exampleText.text = data
    }
    
    private func configureLabel() {
        contentView.addSubview(exampleText)
        exampleText.font = UIFont(name: "Roboto-SemiBold", size: 20)
        exampleText.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(13)
            make.height.equalTo(53)
        }
    }
}
