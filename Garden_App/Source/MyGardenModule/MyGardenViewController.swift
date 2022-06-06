//
//  MyGardenViewController.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 07.05.2022.
//

import Foundation
import UIKit

class MyGardenViewController: UIViewController {
    private var presenter: MyGardenOutput
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyGardenTableViewCell.self, forCellReuseIdentifier: "\(MyGardenTableViewCell.self)")
        return tableView
    }()
    
    private lazy var addButton = UIButton()
    private var plants: [PlantStruct] = [] 
    private var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Напишите название растения"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        textField.layer.shadowOpacity = 5
        textField.layer.shadowRadius = 30
        textField.layer.shadowOffset = CGSize(width: 0, height: 5)
        return textField
    }()
    
    init(presenter: MyGardenOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
        configureInputView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.backgroundColor = .backgroundGreen
        tableView.separatorColor = .lightGreen
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 13, bottom: 0, right: 13)
        tableView.tableHeaderView = UIView.init(frame: CGRect(x: 1, y: 50, width: 0, height: 20))
    }
    
    private func configureNavigationBar() {
        addButton.setImage(UIImage(named: "addIcon"), for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        navigationController?.navigationBar.addSubview(addButton)
        let targetView = self.navigationController?.navigationBar

        let trailingContraint = NSLayoutConstraint(item: addButton, attribute:
                .trailingMargin, relatedBy: .equal, toItem: targetView,
                                 attribute: .trailingMargin, multiplier: 1.0, constant: -16)
        let bottomConstraint = NSLayoutConstraint(item: addButton, attribute: .bottom, relatedBy: .equal,
                                            toItem: targetView, attribute: .bottom, multiplier: 1.0, constant: -6)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([trailingContraint, bottomConstraint])
    }
    
    private func configureInputView() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        toolbar.items = [flexibleSpace, doneButton]
        toolbar.sizeToFit()
        
        textField.inputAccessoryView = toolbar
        textField.delegate = self
    }
    
    @objc func doneButtonTapped() {
        if textField.text != nil {
            textField.resignFirstResponder()
            plants.append(PlantStruct(plantName: textField.text!, workDate: Date.distantPast, wateringDate: Date.distantPast, plantTags: nil, plantsNotes: nil))
            presenter.savePlant(plant: plants[plants.count - 1])
            tableView.reloadData()
        }
    }
    
    @objc func addButtonTapped() {
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.right.equalToSuperview().inset(30)
            make.width.equalTo(265)
            make.height.equalTo(50)
        }
        textField.becomeFirstResponder()
    }
}

extension MyGardenViewController: MyGardenInput {
    func getPlants(plants: [PlantStruct]) {
        self.plants = plants
    }
}

extension MyGardenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyGardenTableViewCell.self)", for: indexPath) as! MyGardenTableViewCell
        cell.setData(data: plants[indexPath.row])
        return cell
    }
}

extension MyGardenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let cornerRadius = 30
        var corners: UIRectCorner = []

        if indexPath.row == 0
        {
            corners.update(with: .topLeft)
            corners.update(with: .topRight)
        }

        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1
        {
            corners.update(with: .bottomLeft)
            corners.update(with: .bottomRight)
        }

        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: cell.bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        cell.layer.mask = maskLayer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let plant = plants[indexPath.row]
        presenter.viewDidSelect(plant: plant)
    }
}

extension MyGardenViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.removeFromSuperview()
    }
}


