//
//  EditableGreenView.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 24.04.2022.
//

import SnapKit

class EditableGreenView: UIView {
    private lazy var textView: UITextView = {
        let tv = UITextView()
        tv.font = .text
        tv.textColor = .black
        tv.textAlignment = .left
        tv.isEditable = true
        tv.keyboardType = .default
        tv.backgroundColor = .clear
        return tv
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .lightGreen
        return view
    }()

    // TODO: (r.akhmadeev) Сначала get {}, потом set {}
    var text: String? {
        set { textView.text = newValue }
        get { return textView.text }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeDarkBackground() {
        self.backgroundView.backgroundColor = .deepGreen
        self.textView.textColor = .white
    }
}

extension EditableGreenView {
    private func setup() {
        addSubview(backgroundView)
        backgroundView.addSubview(textView)
        
        backgroundView.snp.makeConstraints{ maker in
            maker.top
                .trailing
                .leading
                .equalToSuperview()
        }
        
        textView.snp.makeConstraints { maker in
            maker.top
                .trailing
                .leading
                .bottom
                .equalToSuperview()
                .inset(15)
        }
        
        self.snp.makeConstraints {
            $0.bottom.equalTo(backgroundView)
        }
    }
}
