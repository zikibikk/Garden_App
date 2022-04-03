//
//  DesignService.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 02.04.2022.
//

import SnapKit

class DeepGreenView: UIView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .title
        label.textColor = .white
        return label
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15.0
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

    private func setup() {
        addSubview(backgroundView)
        /*backgroundView.snp.makeConstraints {
            $0.edges.equalTo(label)
        }*/
        
        addSubview(label)
        /*label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }*/
    }

    func configure(text: String) {
        label.text = text
    }

    func configure(font: UIFont) {
        label.font = font
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