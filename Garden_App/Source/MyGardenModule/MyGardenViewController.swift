//
//  MyGardenViewController.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 07.05.2022.
//

import Foundation
import UIKit

class MyGardenViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyGardenTableViewCell.self, forCellReuseIdentifier: "\(MyGardenTableViewCell.self)")
        return tableView
    }()
    
    private lazy var addButton = UIButton()
    private var models: [String] = ["пупочек", "крапива", "груша", "пупочек", "крапива", "груша"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
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
    
    @objc func addButtonTapped() {
        models.append("я новенький!")
        tableView.reloadData()
    }
}

extension MyGardenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyGardenTableViewCell.self)", for: indexPath) as! MyGardenTableViewCell
        cell.setData(data: models[indexPath.row])
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
    }
}


