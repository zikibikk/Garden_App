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
    
    private lazy var searchController = UISearchController(searchResultsController: nil)
    
    private var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    private var models = [NoteModel(noteDate: Date(dateString: "30.4.22"),
                                    noteText: "hhhghgeauheobfoboihbijbijtijbjihtuhtuaergygarbhrfahbkfvth"),
                          NoteModel(noteDate: Date(dateString: "1.5.22"),
                                    noteText: "rjshufvhuguihgthuieavouhafviojklnmbgnklbgnjleihutegiuhhyh"),
                          NoteModel(noteDate: Date(dateString: "10.5.22"),
                                    noteText: "rjfvhfhnfvbavfhfshhahhhfhbvknvkgmklgkuirueryetgbcndfvr"),
                          NoteModel(noteDate: Date(dateString: "1.5.22"),
                                    noteText: "rjshufvhuguihgthuieavouhafviojklnmbgnklbgnjleihutegiuhhyh"),
                          NoteModel(noteDate: Date(dateString: "1.5.22"),
                                    noteText: "rjshufvhuguihgthuieavouhafviojklnmbgnklbgnjleihutegiuhhyh"),
                          NoteModel(noteDate: Date(dateString: "1.5.22"),
                                    noteText: "rjshufvhuguihgthuieavouhafviojklnmbgnklbgnjleihutegiuhhyh"),
                          NoteModel(noteDate: Date(dateString: "1.5.22"),
                                    noteText: "rjshufvhuguihgthuieavouhafviojklnmbgnklbgnjleihutegiuhhyh"),
                          NoteModel(noteDate: Date(dateString: "1.5.22"),
                                    noteText: "rjshufvhuguihgthuieavouhafviojklnmbgnklbgnjleihutegiuhhyh")]
    
    private var filteredNotes: [NoteModel] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(MyNotesTableViewCell.self, forCellReuseIdentifier: "\(MyNotesTableViewCell.self)")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureTableView()
        configureSearchController()
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
        navigationItem.searchController = searchController
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Введите текст, тег или дату"
        searchController.isActive = false
        definesPresentationContext = true
    }
    
    private func filterContentForSearchText(searchText: String) {
        lazy var decimalCharacters = CharacterSet.decimalDigits
        filteredNotes = models.filter { (note: NoteModel) -> Bool in
//            if searchText.range(of: ".*[0-9]+.*", options: .regularExpression) != nil || searchText.contains(".") {
//                return note.noteDate.description.contains(searchText.description)
//            } else {
                return note.noteText.lowercased().contains(searchText.lowercased())
//            }
        }
        tableView.reloadData()
    }
    
    @objc func searchButtonTapped() {
        searchController.searchBar.isHidden = false
        searchController.isActive = true
    }
}

extension MyNotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
           return filteredNotes.count
         }

        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyNotesTableViewCell.self)", for: indexPath) as! MyNotesTableViewCell
        if isFiltering {
            cell.setData(data: filteredNotes[indexPath.row])
        } else {
            cell.setData(data: models[indexPath.row])
        }
        return cell
    }
}

extension MyNotesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        navigationItem.hidesSearchBarWhenScrolling = true
    }
}

extension MyNotesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchText: searchBar.text!)
    }
}
