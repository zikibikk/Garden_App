//
//  MyNotesViewController.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 11.05.2022.
//

import Foundation
import UIKit

struct NoteModel {
    var noteDate: Date
    var noteText: String
}

extension Date {
    init(dateString: String) {
        let dateStringFormatter = DateFormatter(dateFormat: "dd.MM.yy")
        dateStringFormatter.locale = NSLocale(localeIdentifier: "ru_RU_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval: 0, since: date)
    }
}

class MyNotesViewController: UIViewController {
    
    private var models = [NoteModel(noteDate: Date(dateString: "30.4.22"),
                                    noteText: "hhhghgeauheobfoboihbijbijtijbjihtuhtuaergygarbhrfahbkfv d7y83t78yr578y57898745th"),
                          NoteModel(noteDate: Date(dateString: "1.5.22"),
                                    noteText: "rjshufvhuguihgthuieavouhafviojklnmbgnklbgnjl;eihutegiuh5q39y75898w46hyh"),
                          NoteModel(noteDate: Date(dateString: "10.5.22"),
                                    noteText: "rjfvhfhnfvbavf6c6rc7cvn6xr378xem89x,09wx0,.ce9m88vr")]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyNotesTableViewCell.self, forCellReuseIdentifier: "\(MyNotesTableViewCell.self)")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureTableView()
    }

    private func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    private func configureNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "searchButton"), style: .plain, target: self, action: #selector(searchButtonTapped))
    }
    
    @objc func searchButtonTapped() {
        print("работаю... жестко")
    }
}

extension MyNotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyNotesTableViewCell.self)", for: indexPath) as! MyNotesTableViewCell
        cell.setData(data: models[indexPath.row])
        return cell
    }
}

extension MyNotesViewController: UITableViewDelegate {

}
