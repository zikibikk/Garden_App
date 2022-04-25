//
//  MyGardenViewController.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 25.04.2022.
//

import Foundation
import SnapKit

class MyGardenViewController: UIViewController {
    private lazy var tableView = UITableView()
    private var addButton = UIButton()
    private var tableViewSubview = UIView()
    private var hardcodedArray: [String] = ["пупочек", "крапива", "груша", "тазик", "ggdog", "ggdog", "ggdog", "ggdog", "ggdog", "ggdog", "ggdog", "ggdog", "ggdog"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableViewSubview()
        configureTableView()
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
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(100)
            make.top.equalToSuperview().inset(165)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyGardenTableViewCell.self, forCellReuseIdentifier: "MyGardenTableViewCell")
        tableView.separatorColor = UIColor(red: 186/255, green: 207/255, blue: 192/255, alpha: 1)
    }
    
    private func configureTableViewSubview() {
        view.addSubview(tableViewSubview)
        tableViewSubview.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(100)
            make.top.equalToSuperview().inset(165)
        }
        tableViewSubview.backgroundColor = .white
        tableViewSubview.layer.cornerRadius = 30
        tableViewSubview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        tableViewSubview.layer.shadowOpacity = 1
        tableViewSubview.layer.shadowRadius = 10
        tableViewSubview.layer.shadowOffset = CGSize(width: 0, height: 5)
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
}
