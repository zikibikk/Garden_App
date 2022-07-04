//
//  MyNotesViewController.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 11.05.2022.
//

import Foundation
import UIKit

// TODO: (r.akhmadeev) Не оч хорошо так разбрасывать модельки.
// Лучше внутри папки `MyNotesModule` создать файл/папку, где будут лежать все модельки, нужные этому модулю
// Если модель переиспользуется в нескольких модулях, то она выносится в отдельную папку с общими модельками
// Так же поправить везде, повторяться в других местах не буду)
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

    // TODO: (r.akhmadeev) В целом норм, но у вас же MVP... Вся логика должна выноситься в presenter
    // 1. Получаем от SearchController уведомление в методе updateSearchResults(...)
    // 2. Передаем строку из searchBar в presenter
    // 3. Presenter фильтрует исходных массив
    // 4. Presenter передает контроллеру отфильтрованный массив
    // 5. Контроллер сохраняет его у себя и перезагружает таблицу
    // 6. Мы молодцы) Теперь у контроллера не 2 массива, а всего 1
    // 7. Пишите, если не понятно ;)
    private func filterContentForSearchText(searchText: String) {
        // TODO: (r.akhmadeev) внутри функции от lazy смысла нет)
        // TODO: (r.akhmadeev) `decimalCharacters` вообще не используется... Удалить
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
        // TODO: (r.akhmadeev) опасно)) лучше force unwrap не делать
        filterContentForSearchText(searchText: searchBar.text!)
    }
}
