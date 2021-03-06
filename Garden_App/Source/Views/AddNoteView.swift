//
//  Button.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 04.04.2022.
//

import SnapKit

class AddNoteView: UIView {
    private lazy var inscription: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .buttonTitle
        label.text = "Добавить заметку"
        return label
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        view.backgroundColor = .deepGreen
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddNoteView {
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
