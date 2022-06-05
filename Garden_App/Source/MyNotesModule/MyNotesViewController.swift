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

class MyNotesViewController: UIViewController {
    private let presenter: MyNotesOutput
    private lazy var searchController = UISearchController(searchResultsController: nil)
    
    private var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    private var notes: [NoteStruct] = []
    
    private var filteredNotes: [NoteStruct] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(MyNotesTableViewCell.self, forCellReuseIdentifier: "\(MyNotesTableViewCell.self)")
        return tableView
    }()
    
    init(presenter: MyNotesOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureTableView()
        configureSearchController()
        presenter.viewDidLoad()
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
        searchController.searchBar.placeholder = "Введите текст или тег"
        searchController.isActive = false
        searchController.searchBar.isHidden = true
        definesPresentationContext = true
    }
    
    private func filterContentForSearchText(searchText: String) {
        lazy var decimalCharacters = CharacterSet.decimalDigits
        filteredNotes = notes.filter { (note: NoteStruct) -> Bool in
                return note.noteText.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    @objc func searchButtonTapped() {
        searchController.searchBar.isHidden = false
        searchController.isActive = true
    }
}

extension MyNotesViewController: MyNotesInput {
    func getNotes(notes: Array<NoteStruct>) {
        self.notes = notes
        tableView.reloadData()
    }
}

extension MyNotesViewController: MyNotesCellDelegate {
    func myNotesCell(_ cell: MyNotesTableViewCell, didSelect note: String, by date: Date) {
        presenter.viewDidSelect(date: date)
    }
}

extension MyNotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
           return filteredNotes.count
         }
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyNotesTableViewCell.self)", for: indexPath) as! MyNotesTableViewCell
        if isFiltering {
            cell.setData(data: filteredNotes[indexPath.row])
        } else {
            cell.setData(data: notes[indexPath.row])
        }
        cell.delegate = self
        return cell
    }
}

extension MyNotesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchText: searchBar.text!)
    }
}
