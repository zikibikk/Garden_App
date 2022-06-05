//
//  PlantViewController.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation
import UIKit
import SnapKit

protocol PlantViewSizeDelegate: AnyObject {
    func plantViewContentSize(_ view: UIView)
}

class PlantViewController: UIViewController {
    //private let presenter: PlantViewOutput
    weak var delegate: PlantViewSizeDelegate?
    private let scrollView = UIScrollView()
    private let rombAccessoryOneImage = UIImageView (image: UIImage(named: "rombAccessory"))
    private let rombAccessoryTwoImage = UIImageView(image: UIImage(named: "rombAccessory"))
    private let reminderView = PlantReminderView()
    private let noteView = PlantNoteView()
    private let addNoteButton = UIButton()
    private let addReminderButton = UIButton()
    private var tags: [TagView]?
    private lazy var dateService = DateService()
    
    private var lastWorkTextField: UITextField = {
            let textField = UITextField()
            textField.text = "Добавьте"
            textField.textColor = .gray
            textField.font = .tag
            return textField
        }()
        
        private var lastWateringTextField: UITextField = {
            let textField = UITextField()
            textField.text = "Добавьте"
            textField.textColor = .gray
            textField.font = .tag
            return textField
        }()
    
    private let datePickerForLastWork: UIDatePicker = {
        let datePicker = UIDatePicker(frame: CGRect(x: 10, y: 50, width: 50, height: 50))
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    private let datePickerForLastWatering: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    private let lastWorkLabel: UILabel = {
        let label = UILabel()
        label.text = "Последняя обработка"
        label.font = .text
        label.textColor = .black
        return label
    }()
    
    private let lastWateringLabel: UILabel = {
        let label = UILabel()
        label.text = "Последний полив"
        label.font = .text
        label.textColor = .black
        return label
    }()
    
    private let noteLabel: UILabel = {
        let label = UILabel()
        label.text = "Заметки"
        label.font = UIFont(name: "Roboto", size: 16)
        label.textColor = .gray
        return label
    }()
    
    private let reminderLabel: UILabel = {
        let label = UILabel()
        label.text = "Напоминания"
        label.font = UIFont(name: "Roboto", size: 16)
        label.textColor = .deepGreen
        return label
    }()
    
    private lazy var tagInscription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.text = "Теги"
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 25, height: 125)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
//    init() {
//        self.presenter = presenter
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureInformationView()
        configureDatePicking()
        configureShadowsForViews()
        configureViewInscriptions()
        configureTags()
    }
    
    private func configureInformationView() {
        view.backgroundColor = .white
        scrollView.addSubview(lastWorkTextField)
        scrollView.addSubview(lastWateringTextField)
        scrollView.addSubview(rombAccessoryOneImage)
        scrollView.addSubview(rombAccessoryTwoImage)
        scrollView.addSubview(lastWorkLabel)
        scrollView.addSubview(lastWateringLabel)
        lastWorkTextField.delegate = self
        lastWateringTextField.delegate = self
        
        lastWorkTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.left.equalToSuperview().inset(38)
            make.height.equalTo(41)
            make.width.equalTo(75)
        }
        
        lastWateringTextField.snp.makeConstraints { make in
            make.top.equalTo(lastWorkTextField.snp_bottomMargin).inset(-29)
            make.left.equalToSuperview().inset(38)
            make.height.equalTo(41)
            make.width.equalTo(75)
        }
        
        rombAccessoryOneImage.snp.makeConstraints { make in
            make.leading.equalTo(lastWorkTextField.snp_trailingMargin).inset(-35)
            make.top.equalToSuperview().inset(43)
        }
        
        rombAccessoryTwoImage.snp.makeConstraints { make in
            make.leading.equalTo(lastWateringTextField.snp_trailingMargin).inset(-35)
            make.top.equalTo(rombAccessoryOneImage.snp_bottomMargin).inset(-55)
        }
        
        lastWorkLabel.snp.makeConstraints { make in
            make.leading.equalTo(rombAccessoryOneImage.snp_trailingMargin).inset(-15)
            make.top.equalToSuperview().inset(40)
        }
        
        lastWateringLabel.snp.makeConstraints { make in
            make.leading.equalTo(rombAccessoryTwoImage.snp_trailingMargin).inset(-15)
            make.top.equalTo(lastWorkLabel.snp_bottomMargin).inset(-49)
        }
    }
    
    private func configureDatePicking() {
        datePickerForLastWork.addTarget(self, action: #selector(dateChoosen), for: .valueChanged)
        datePickerForLastWatering.addTarget(self, action: #selector(secondDateChoosen), for: .valueChanged)
    }
    
    private func configureViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(reminderView)
        scrollView.addSubview(noteView)
        
        scrollView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        reminderView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(160)
            make.left.equalToSuperview().inset(26)
            make.height.equalTo(90)
            make.width.equalTo(362)
        }
        
        noteView.snp.makeConstraints { make in
            make.top.equalTo(reminderView.snp_bottomMargin).inset(-7)
            make.left.equalToSuperview().inset(26)
            make.height.equalTo(90)
            make.width.equalTo(362)
        }
        
        reminderView.layer.cornerRadius = 13
        reminderView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        reminderView.backgroundColor = .white
        
        noteView.layer.cornerRadius = 13
        noteView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        noteView.backgroundColor = .lightGreen
    }
    
    private func configureShadowsForViews() {
        reminderView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        reminderView.layer.shadowOpacity = 1
        reminderView.layer.shadowRadius = 10
        reminderView.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        noteView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        noteView.layer.shadowOpacity = 1
        noteView.layer.shadowRadius = 5
        noteView.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    private func configureViewInscriptions() {
        scrollView.addSubview(reminderLabel)
        scrollView.addSubview(noteLabel)
        scrollView.addSubview(addNoteButton)
        scrollView.addSubview(addReminderButton)
        
        addNoteButton.setImage(UIImage(named: "addIcon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        addNoteButton.tintColor = .deepGreen
        addReminderButton.setImage(UIImage(named: "addIcon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        addReminderButton.tintColor = .gray
        
        reminderLabel.snp.makeConstraints { make in
            make.top.equalTo(reminderView.snp_topMargin).inset(-3)
            make.leading.equalTo(reminderView.snp_leadingMargin).inset(3)
        }
        
        noteLabel.snp.makeConstraints { make in
            make.top.equalTo(noteView.snp_topMargin).inset(-3)
            make.leading.equalTo(noteView.snp_leadingMargin).inset(3)
        }
        
        addReminderButton.snp.makeConstraints { make in
            make.top.equalTo(reminderView.snp_topMargin).inset(-3)
            make.trailing.equalTo(reminderView.snp_trailingMargin).inset(1)
            make.height.width.equalTo(24)
        }
        
        addNoteButton.snp.makeConstraints { make in
            make.top.equalTo(noteView.snp_topMargin).inset(-3)
            make.trailing.equalTo(reminderView.snp_trailingMargin).inset(1)
            make.height.width.equalTo(24)
        }
    }
    
    private func configureTags() {
        scrollView.addSubview(tagInscription)
        scrollView.addSubview(collectionView)
        
        tagInscription.snp.makeConstraints { make in
            make.top.equalTo(noteView.snp_bottomMargin).inset(-50)
            make.left.equalToSuperview().inset(30)
        }
        
        collectionView.snp.makeConstraints { maker in
            maker.top.equalTo(tagInscription.snp_bottomMargin).inset(-10)
            maker.left.right.equalToSuperview().inset(22)
            maker.width.equalToSuperview().inset(44)
        }
    }
    
    @objc func dateChoosen() {
        lastWorkTextField.text = dateService.getDecimalDate(date: datePickerForLastWork.date)
        lastWorkTextField.font = .date
        lastWorkTextField.textColor = .black
        self.view.endEditing(true)
    }
    
    @objc func secondDateChoosen() {
        lastWateringTextField.text = dateService.getDecimalDate(date: datePickerForLastWatering.date)
        lastWateringTextField.font = .date
        lastWateringTextField.textColor = .black
        self.view.endEditing(true)
    }
}

extension PlantViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if lastWorkTextField.isEditing {
            scrollView.addSubview(datePickerForLastWork)
            datePickerForLastWork.snp.makeConstraints { make in
                make.left.equalTo(lastWorkTextField.snp_leftMargin).inset(-10)
                make.top.equalTo(lastWorkTextField.snp_bottomMargin).inset(-10)
            }
        }
        
        if lastWateringTextField.isEditing {
            scrollView.addSubview(datePickerForLastWatering)
            datePickerForLastWatering.snp.makeConstraints { make in
                make.left.equalTo(lastWateringTextField.snp_leftMargin).inset(-10)
                make.top.equalTo(lastWateringTextField.snp_bottomMargin).inset(-10)
            }
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !lastWorkTextField.isEditing {
            datePickerForLastWork.removeFromSuperview()
        }
        
        if !lastWateringTextField.isEditing {
            datePickerForLastWatering.removeFromSuperview()
        }
    }
}

extension PlantViewController: PlantInput {
    func getPlant(plant: PlantStruct) {
        self.title = plant.plantName
        delegate?.plantViewContentSize(reminderView)
        delegate?.plantViewContentSize(noteView)
    }
}

extension PlantViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tags?.count ?? 0
    }
}

extension PlantViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        cell.addSubview(tags?[indexPath.row] ?? UIView())
        return cell
    }
}
