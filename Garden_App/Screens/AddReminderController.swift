//
//  AddNoteController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 20.04.2022.
//

import Foundation
import SnapKit

class AddReminderController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.text = "Напоминание"
        label.textAlignment = .center
        return label
    }()
    private lazy var textField: UITextField = {
       let tf = UITextField()
        tf.borderStyle = .roundedRect
        return tf
    }()
    private lazy var datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        if #available(iOS 13.4, *) {
            dp.preferredDatePickerStyle = .wheels
        }
        dp.locale = .init(identifier: Locale.preferredLanguages.first!)
        return dp
    }()
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .deepGreen
        button.titleLabel?.font = .buttonTitle
        button.titleLabel?.text = "Поставить напоминание"
        return button
    }()
    private lazy var horizontalView: UIStackView = {
        let hv = UIStackView()
        hv.axis = .vertical
        hv.spacing = 20
        return hv
    }()
    
    override func viewDidLoad() {
        setup()
        super.viewDidLoad()
    }
}

extension AddReminderController {
    func setup() {
        self.view.backgroundColor = .white
//        self.view.addSubview(titleLabel)
////        self.view.addSubview(cancelButton)
//        self.view.addSubview(textField)
//        self.view.addSubview(datePicker)
//        self.view.addSubview(addButton)
        self.view.addSubview(horizontalView)
        
        horizontalView.snp.makeConstraints { maker in
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalToSuperview()
                .inset(100 )
        }
        
        horizontalView.addArrangedSubview(titleLabel)
        horizontalView.addArrangedSubview(textField)
        horizontalView.addArrangedSubview(datePicker)
        horizontalView.addArrangedSubview(addButton)
    }
}
