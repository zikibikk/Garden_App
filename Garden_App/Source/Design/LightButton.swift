//
//  LightButton.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 11.04.2022.
//

import SnapKit
import Darwin

class AddReminderButton: UIButton {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .buttonTitle
        button.setTitle("Добавить напоминание", for: .normal)
        return button
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        view.layer.borderColor = CGColor(red: 78/255, green: 161/255, blue: 101/255, alpha: 0.29)
        view.layer.borderWidth = 3
        view.backgroundColor = .lightGreen
        return view
    }()
    
    private var isPressed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddReminderButton {
    
    private func setup() {
        addSubview(backgroundView)
        backgroundView.addSubview(button)
        
        backgroundView.snp.makeConstraints { maker in
            maker.top
                .left
                .right
                .equalToSuperview()
        }
        
        button.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(15)
            maker.top.equalToSuperview().inset(4)
            maker.bottom.equalToSuperview().inset(9)
        }
    }
}
