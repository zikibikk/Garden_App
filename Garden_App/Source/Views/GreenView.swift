//
//  DesignService.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 02.04.2022.
//
import SnapKit

class GreenView: UIView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.font = .text
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .deepGreen
        return view
    }()
    
    var text: String? {
        set { label.text = newValue }
        get { return label.text }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeLightBackground() {
        self.backgroundView.backgroundColor = .lightGreen
        self.label.textColor = .black
    }
}

extension GreenView {
    private func setup() {
        addSubview(backgroundView)
        backgroundView.addSubview(label)
        
        backgroundView.snp.makeConstraints{ maker in
            maker.top
                .trailing
                .leading
                .equalToSuperview()
            maker.bottom.equalTo(label).offset(15)
        }
        
        label.snp.makeConstraints { maker in
            maker.top
                .trailing
                .leading
                .equalToSuperview()
                .inset(15)
        }
        
        self.snp.makeConstraints {
            $0.bottom.equalTo(backgroundView)
        }
    }
}
