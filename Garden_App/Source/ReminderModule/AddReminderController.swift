//
//  AddNoteController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 20.04.2022.
//

import Foundation
import SnapKit

class AddReminderController: UIViewController {
    
    weak var router: IReminderRouter?
    
    private let reminderService: IReminderService
    
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
        tf.keyboardType = .default
        tf.enablesReturnKeyAutomatically = true
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
        let button = UIButton(type: .system)
        button.setTitle("Поставить напоминание", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .buttonTitle
        button.backgroundColor = .deepGreen
        return button
    }()
    
    private lazy var verticalView: UIStackView = {
        let hv = UIStackView()
        hv.axis = .vertical
        hv.spacing = 12
        return hv
    }()
    
    private lazy var reminderGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addReminder(_:)))
    
    override func viewDidLoad() {
        setup()
        super.viewDidLoad()
    }
    
    init(reminderService: IReminderService) {
        self.reminderService = reminderService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddReminderController {
    func setup() {
        self.view.backgroundColor = .white
        self.view.addSubview(verticalView)
        
        addButton.snp.makeConstraints({ $0.height.equalTo(Constraints.fieldHeight)})
        
        verticalView.snp.makeConstraints { maker in
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalToSuperview()
                .inset(30)
        }
        
        verticalView.addArrangedSubview(titleLabel)
        verticalView.addArrangedSubview(textField)
        verticalView.addArrangedSubview(datePicker)
        verticalView.addArrangedSubview(addButton)
        addButton.addGestureRecognizer(reminderGestureRecognizer)
        self.view.snp.makeConstraints({$0.bottom.equalTo(verticalView).offset(25)})
    }
}

extension AddReminderController {
    @objc func addReminder(_ sender:UITapGestureRecognizer) {
        textField.endEditing(true)
        let reminder = ReminderStruct(reminderText: textField.text ?? "", reminderDate: datePicker.date)
        reminderService.addReminder(reminder: reminder)
        print(reminder.reminderText, " ", reminder.reminderDate)
        router?.closeReminderVC()
    }
}
