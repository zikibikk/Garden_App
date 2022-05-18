//
//  UsersViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 18.05.2022.
//

import UIKit

final class UsersViewController: UIViewController {
    private let presenter: UsersViewOutput
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        return tableView
    }()
    
    private lazy var loader = UIActivityIndicatorView(style: .medium)
    
    private var users: [User] = []
    
    init(presenter: UsersViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter.viewDidLoad()
    }
    
    private func configureView() {
        title = "Users List"
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.insertSubview(loader, aboveSubview: tableView)
        loader.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

extension UsersViewController: UsersViewInput {
    func show(users: [User]) {
        self.users = users
        tableView.reloadData()
    }
    
    func showLoader() {
        loader.startAnimating()
    }
    
    func hideLoader() {
        loader.stopAnimating()
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)")!
        let user = users[indexPath.row]
        cell.textLabel?.text = user.firstName
        return cell
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        presenter.viewDidSelect(user: user)
    }
}
