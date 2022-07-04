//
//  LightButton.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 11.04.2022.
//

import SnapKit
import Darwin

class AddReminderView: UIView {
    
    private lazy var inscription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.text = "Добавить напоминание"
        return label
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
    // TODO: (r.akhmadeev) Для чего?
    private var isPressed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddReminderView {
    
    private func setup() {
        addSubview(backgroundView)
        backgroundView.addSubview(inscription)
        
        backgroundView.snp.makeConstraints { maker in
            maker.top
                .left
                .right
                .equalToSuperview()
            maker.height.equalTo(Constraints.fieldHeight)
        }
        
        inscription.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(15)
            maker.top.equalToSuperview().inset(4)
            maker.bottom.equalToSuperview().inset(9)
        }
        
        self.snp.makeConstraints {
            $0.bottom.equalTo(backgroundView)
        }
    }
}
