//
//  TagView.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 25.04.2022.
//

import SnapKit
import UIKit

class TagView: UIView {
    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .tag
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var text: String? {
        set { title.text = newValue }
        get { return title.text }
    }
    var color: UIColor? {
        set { self.backgroundColor = newValue }
        get { return self.backgroundColor}
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TagView {
    func setup() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 13
        self.addSubview(title)
        
        title.snp.makeConstraints { maker in
            maker.top
                .left
                .equalToSuperview()
                .inset(7)
        }
        
        self.snp.makeConstraints { maker in
            maker.bottom.equalTo(title).offset(7)
            maker.right.equalTo(title).offset(7)
        }
    }
}

extension TagView {
    static var addTag: TagView {
        let tag = TagView()
        tag.text = "+"
        tag.color = .lightGreen
        tag.snp.makeConstraints { $0.width.equalTo(75)}
        return tag
    }
}

extension UIButton {
    static var addTag: UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .lightGreen
        button.tintColor = .gray
        button.setImage(UIImage(named: "addIcon"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 13
        button.snp.makeConstraints { maker in
            maker.height.equalTo(25)
            maker.width.equalTo(75)
        }
        return button
    }
}
