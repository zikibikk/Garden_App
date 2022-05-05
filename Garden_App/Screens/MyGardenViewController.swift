//
//  MyGardenViewController.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 25.04.2022.
//

import Foundation
import UIKit
import SnapKit

class MyGardenViewController: UIViewController {
    private lazy var tableView = SelfSizingTableView()
    private var addButton = UIButton()
    private var shadowView = UIView()
    private var hardcodedArray: [String] = ["пупочек", "крапива", "груша", "пупочек", "крапива", "груша"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureShadowView()
        configureTableView()
        tableView.reloadData()
    }
    
    private func configureView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.isNavigationBarHidden = false
        title = "Мой сад"
        self.navigationController?.title = ""
        view.backgroundColor = .white
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(330)
            make.right.equalToSuperview().inset(17)
            make.bottom.equalToSuperview().inset(764)
        }
        addButton.setImage(UIImage(named: "addIcon"), for: .normal)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 53
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(25)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(CGFloat(hardcodedArray.count) * tableView.rowHeight)
        }
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 30
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyGardenTableViewCell.self, forCellReuseIdentifier: "MyGardenTableViewCell")
        tableView.separatorColor = UIColor(red: 186/255, green: 207/255, blue: 192/255, alpha: 1)
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 13, bottom: 0, right: 13)
    }
    
    private func configureShadowView() {
        view.addSubview(shadowView)
        tableView.rowHeight = 53
        shadowView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(25)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(CGFloat(hardcodedArray.count) * tableView.rowHeight)
        }
        shadowView.backgroundColor = .white
        shadowView.layer.cornerRadius = 30
        shadowView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}

class SelfSizingTableView: UITableView {

    var maxHeight: CGFloat = UIScreen.main.bounds.size.height

    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }

    override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height + 100, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
}

extension MyGardenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hardcodedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MyGardenTableViewCell", for: indexPath) as! MyGardenTableViewCell
        cell.setData(data: hardcodedArray[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let cornerRadius = 30
//        var corners: UIRectCorner = []
//
//        if indexPath.row == 0
//        {
//            corners.update(with: .topLeft)
//            corners.update(with: .topRight)
//        }
//
//        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1
//        {
//            corners.update(with: .bottomLeft)
//            corners.update(with: .bottomRight)
//        }
//
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = UIBezierPath(roundedRect: cell.bounds,
//                                      byRoundingCorners: corners,
//                                      cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
//        cell.layer.mask = maskLayer
//    }
}

