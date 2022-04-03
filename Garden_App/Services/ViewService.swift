//
//  DesignService.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 02.04.2022.
//

import UIKit
import Foundation

class ViewService {
    
    static func configureLabel(text: String, font: UIFont, color: UIColor) -> UILabel {
        let resultLabel = UILabel()
        resultLabel.text = text
        resultLabel.font = font
        resultLabel.textColor = color
        return resultLabel
    }
    
    //TODO: рамки по периметру текста, чтобы граница цета начиналась раньше, чем текст
    static func configureNoteLabel(text: String, font: UIFont, color: UIColor, backgroundColor: UIColor) -> UILabel {
        let resultLabel = UILabel()
        resultLabel.text = text
        resultLabel.font = font
        resultLabel.textColor = color
        
        resultLabel.backgroundColor = backgroundColor
        resultLabel.layer.masksToBounds = true
        resultLabel.layer.cornerRadius = 15.0
        resultLabel.numberOfLines = 0
        return resultLabel
    }
    
    static func configureTextView(text: String, font: UIFont, color: UIColor) -> UITextView {
        let resultTextView = UITextView()
        resultTextView.text = text
        resultTextView.font = font
        resultTextView.textColor = color
        return resultTextView
    }
    
}

class AdviceView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private lazy var backgroundView: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        addSubview(titleLabel)
    }

    func configure(text: String) {
        titleLabel.text = text
    }

    func configure(font: UIFont) {
        titleLabel.font = font
    }
}


protocol ICalculationService {
    func getValue() -> Int
}

class CalculationService: ICalculationService {
    private let value: Int

    init(value: Int) {
        self.value = value
    }

    func getValue() -> Int {
        value
    }
}

class TestableService {
    private let service: ICalculationService

    init(service: ICalculationService) {
        self.service = service
    }

    func calculate(value: Int) -> Int {
        service.getValue() + value
    }
}

func test() {
    let calculationService = CalculationService(value: 8)
    let testableService = TestableService(service: calculationService)
    let result = testableService.calculate(value: 4)
    assert(result == 12)
}
